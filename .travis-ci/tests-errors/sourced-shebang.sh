#!/usr/local/sbin/shellchecker --external-sources bash


## Find true directory script resides in, true name, and true path
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"
__DIR_NAME__="${__DIR__##*/}"
__NAME__="${__SOURCE__##*/}"


# shellcheck source=.travis-ci/tests-errors/lib/sourced-shebang.sh
source "${__DIR__}/lib/sourced-shebang.sh"

sourced_shebang "${__DIR_NAME__}/${__NAME__}"

