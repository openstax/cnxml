CNXML_REPO_ROOT="./cnxml"

[[ -f ./err.log ]] && rm ./err.log

for cnxml_file in $(find . -name index.cnxml | sort); do
    echo "validating ${cnxml_file}"
    java -jar ${CNXML_REPO_ROOT}/cnxml/jing.jar ${CNXML_REPO_ROOT}/cnxml/xml/cnxml/schema/rng/0.8/cnxml-jing.rng "${cnxml_file}" >> err.log
    exit_code=$?
    if [[ ${exit_code} != 0 ]]; then
        >&2 echo "FAILED to validate ${cnxml_file}. Exit code ${exit_code}"
    fi
done

echo "========= Done validating all books. Here are the errors ====="

# split errors and count unique sorted by count descending
cat err.log | awk -F ': error: ' '{ print $2 }' | sort | uniq --count | sort -nr

# https://legacy.cnx.org/content/m61118/latest/#eip-854