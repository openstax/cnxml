set -euxo pipefail

_find_xsd_path() {
    find /cnxml/poet -type d -name xsd | head -n 1
}

generate-schema() {
    while test -n "${1:-}"; do
        case "$1" in
            --unpatched)
                do_patch=0
            ;;
            *)
                echo "Unknown option: $1" >&2
            ;;
        esac
        shift 1
    done

    if ! [ -e poet ]; then
        mkdir poet
        pushd poet &>/dev/null
        git init
        git remote add origin https://github.com/openstax/poet
        popd &>/dev/null
    fi

    pushd poet &>/dev/null
    git fetch --depth=1 origin $branch
    git reset --hard origin/$branch
    popd &>/dev/null

    xsd_path=$(_find_xsd_path)

    jing -i -s ./cnxml/xml/poet/schema/rng/poet-jing.rng > poet-simplified.rng
    trang -I rng -O xsd poet-simplified.rng "$xsd_path"/mathml.xsd

    pushd ./poet &>/dev/null
    rm -f "$xsd_path"*.rej
    rm -f "$xsd_path"*.orig
    if [ ${do_patch:-1} -eq 1 ]; then
        patch -p1 < "$xsd_path"/trang.patch
    else
        git add "$xsd_path"
        git commit -m "unpatched"
        git checkout origin/$branch -- "$xsd_path"
        git restore --staged .
        echo "Ready for changes. When you are done, run generate-patch." >&2
    fi
}

generate-patch() {
    pushd poet &>/dev/null
    xsd_path=$(_find_xsd_path)
    git restore --staged . || true
    git diff --patch -- "$xsd_path"/*.xsd > "$xsd_path"/trang.patch
    popd &>/dev/null
}

command="${1:?Command is required}"
shift

args=()
while test -n "${1:-}"; do
    case "$1" in
        --branch)
            branch="$2"
            shift
        ;;
        *)
            args+=("$1")
        ;;
    esac
    shift
done
: "${branch:=main}"

case "$command" in
    "generate-schema")
        generate-schema "${args[@]}"
    ;;
    "generate-patch")
        generate-patch "${args[@]}"
    ;;
    *)
        echo "Unknown command: $command" >&2
    ;;
esac
