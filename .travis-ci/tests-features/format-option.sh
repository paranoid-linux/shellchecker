#!/usr/local/sbin/shellchecker --format=gcc bash


printf '_noOpp -> %s\n' "${_noOpp}"
## Above should report...
# .travis-ci/format-option.sh:4:26: warning: _noOpp is referenced but not assigned. [SC2154]

