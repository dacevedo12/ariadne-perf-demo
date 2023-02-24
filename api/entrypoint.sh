function main {
  : \
    && pushd api/src \
    && hypercorn \
        --reload \
        "app:APP" \
    && popd \
    || return 1
}

main "${@}"
