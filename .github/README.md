# Shellchecker
[heading__top]:
  #shellchecker
  "&#x2B06; Shebang wrapper runs script if `shellcheck` returns no errors"


Shebang wrapper runs script if `shellcheck` returns no errors


## [![Byte size of Shellchecker][badge__main__shellchecker__source_code]][shellchecker__main__source_code] [![Open Issues][badge__issues__shellchecker]][issues__shellchecker] [![Open Pull Requests][badge__pull_requests__shellchecker]][pull_requests__shellchecker] [![Latest commits][badge__commits__shellchecker__main]][commits__shellchecker__main] [![Build Status][badge_travis_ci]][build_travis_ci]


---


- [:arrow_up: Top of Document][heading__top]

- [:building_construction: Requirements][heading__requirements]

- [:zap: Quick Start][heading__quick_start]

- [&#x1F9F0; Usage][heading__usage]

- [&#x1F5D2; Notes][heading__notes]

  - [Compatible Shells][heading__compatible_shells]
  - [Environment Variables][heading__environment_variables]
  - [Return Values][heading__return_values]

- [:chart_with_upwards_trend: Contributing][heading__contributing]

  - [:trident: Forking][heading__forking]
  - [:currency_exchange: Sponsor][heading__sponsor]


- [:card_index: Attribution][heading__attribution]

- [:balance_scale: Licensing][heading__license]


---



## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


Install via the package manager for your distribution; `gawk`, `make`, and `shellcheck`, packages that this repository depends upon...


- Arch based Operating Systems


```Bash
sudo packman -Syy

sudo packman -S gwak make shellcheck
```


- Debian derived Operating Systems...


```Bash
sudo apt-get update

sudo apt-get install gawk make shellcheck
```


Additionally the `shellchecker` script is tested and written for Bash version `4.4`; please ensure that this version, or greater, is installed on your device prior to opening new bug related Issues.


______


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


Clone this project to a `root` owned directory...


**Linux/MacOS**


```Bash
cd /usr/local/etc

sudo git clone git@github.com:paranoid-linux/shellchecker.git
```


Install via `make`...


```Bash
cd /usr/local/etc/shellchecker

sudo make install
```


Uninstall/unlink via `make`...


```Bash
cd /usr/local/etc/shellchecker

sudo make uninstall
```


Upgrade/update via `git`...


```Bash
cd /usr/local/etc/shellchecker

sudo git pull
```


______


## Usage
[heading__usage]:
  #usage
  "&#x1F9F0; How to utilize this repository"


Write a script that uses `/usr/local/sbin/shellchecker` as the shebang...


**`example.sh`**


```Bash
#!/usr/local/sbin/shellchecker --format=gcc bash --restricted

_argument_list=("${@}")
for i in "${!_argument_list[@]}"; do
    printf '_argument_list[%i] -> %s\n' "${i}" "${_argument_list[${i}]}"
done
```


Provide executable permissions and run `example.sh` script...


```Bash
chmod u+x ./example.sh


./example.sh
```


Append an error producing line and attempt to re-run the `example.sh` script...


```Bash
tee -a ./example.sh 1>/dev/null <<EOF
echo "${_noOpp}"
EOF


./example.sh
```


Output _should_ be similar to...


```
./example.sh:8:7: warning: _noOpp is referenced but not assigned. [SC2154]
```


______


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


This repository may not be feature complete and/or fully functional, Pull Requests that add features or fix bugs are certainly welcomed.


---


### Compatible Shells
[heading__compatible_shells]:
  #compatible-shells
  "Shell environments that `shellchecker` is compatible with"


The `shellchecker` shebang wrapper script _should_ be compatible with shells that the `shellcheck` package supports;


- `bash`

- `dash`

- `ksh`

- `sh`


---


### Environment Variables
[heading__environment_variables]:
  #environment-variables
  "Variables that may be set to modify `shellchecker` behaviour"


Setting `SHELLCHECKER_VERBOSE` environment variable to any number greater than `0` will enable printing commands to standard error, eg...


```Bash
SHELLCHECKER_VERBOSE=1 ./example.sh
```


---


### Return Values
[heading__return_values]:
  #return-values
  "Exit status codes that `shellcheck` may return"


ShellCheck uses the follow exit codes:


- 0: All files successfully scanned with no issues.

- 1: All files successfully scanned with some issues.

- 2: Some files could not be processed (e.g.  file not found).

- 3: ShellCheck was invoked with bad syntax (e.g.  unknown flag).

- 4: ShellCheck was invoked with bad options (e.g.  unknown formatter).


> Check `man shellcheck` for more information.


______


## Contributing
[heading__contributing]:
  #contributing
  "&#x1F4C8; Options for contributing to shellchecker and paranoid-linux"


Options for contributing to shellchecker and paranoid-linux


---


### Forking
[heading__forking]:
  #forking
  "&#x1F531; Tips for forking shellchecker"


Start making a [Fork][shellchecker__fork_it] of this repository to an account that you have write permissions for.


- Add remote for fork URL. The URL syntax is _`git@github.com:<NAME>/<REPO>.git`_...


```Bash
cd ~/git/hub/paranoid-linux/shellchecker

git remote add fork git@github.com:<NAME>/shellchecker.git
```


- Commit your changes and push to your fork, eg. to fix an issue...


```Bash
cd ~/git/hub/paranoid-linux/shellchecker


git commit -F- <<'EOF'
:bug: Fixes #42 Issue


**Edits**


- `<SCRIPT-NAME>` script, fixes some bug reported in issue
EOF


git push fork main
```


> Note, the `-u` option may be used to set `fork` as the default remote, eg. _`git push fork main`_ however, this will also default the `fork` remote for pulling from too! Meaning that pulling updates from `origin` must be done explicitly, eg. _`git pull origin main`_


- Then on GitHub submit a Pull Request through the Web-UI, the URL syntax is _`https://github.com/<NAME>/<REPO>/pull/new/<BRANCH>`_


> Note; to decrease the chances of your Pull Request needing modifications before being accepted, please check the [dot-github](https://github.com/paranoid-linux/.github) repository for detailed contributing guidelines.


---


### Sponsor
  [heading__sponsor]:
  #sponsor
  "&#x1F4B1; Methods for financially supporting paranoid-linux that maintains shellchecker"


Thanks for even considering it!


Via Liberapay you may [![sponsor__shields_io__liberapay]][sponsor__link__liberapay] on a repeating basis.


Regardless of if you're able to financially support projects such as shellchecker that paranoid-linux maintains, please consider sharing projects that are useful with others, because one of the goals of maintaining Open Source repositories is to provide value to the community.


______


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)

- [GitHub Gist -- postmodern -- Makefile](https://gist.github.com/postmodern/3224049)

- [GNU -- Makefile -- Special Built-in Target Names](https://www.gnu.org/software/make/manual/html_node/Special-Targets.html#Special-Targets)

- [StackOverflow -- Common GNU Makefile directory path](https://stackoverflow.com/questions/322936/)

- [StackOverflow -- How can I use bash syntax in makefile targets](https://stackoverflow.com/questions/589276/)

- [StackOverflow -- How to use multiline command in script with YAML](https://stackoverflow.com/questions/38745696/)

- [StackOverflow -- How to write loop in a Makefile](https://stackoverflow.com/questions/1490949/)

- [StackOverflow -- OS detecting Makefile](https://stackoverflow.com/questions/714100/)

- [StackOverflow -- Why does shellcheck fail when a source file is representing the variables at the top of a script?](https://stackoverflow.com/questions/58587756/)

- [Twitter -- Julia Evans (@b0rk)](https://twitter.com/b0rk/status/1314565381131063297)


______


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
Shebang wrapper runs script if `shellcheck` returns no errors
Copyright (C) 2020 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```


For further details review full length version of [AGPL-3.0][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"


[badge__commits__shellchecker__main]:
  https://img.shields.io/github/last-commit/paranoid-linux/shellchecker/main.svg

[commits__shellchecker__main]:
  https://github.com/paranoid-linux/shellchecker/commits/main
  "&#x1F4DD; History of changes on this branch"


[shellchecker__community]:
  https://github.com/paranoid-linux/shellchecker/community
  "&#x1F331; Dedicated to functioning code"


[issues__shellchecker]:
  https://github.com/paranoid-linux/shellchecker/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[shellchecker__fork_it]:
  https://github.com/paranoid-linux/shellchecker/
  "&#x1F531; Fork it!"

[pull_requests__shellchecker]:
  https://github.com/paranoid-linux/shellchecker/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[shellchecker__main__source_code]:
  https://github.com/paranoid-linux/shellchecker/
  "&#x2328; Project source!"

[badge__issues__shellchecker]:
  https://img.shields.io/github/issues/paranoid-linux/shellchecker.svg

[badge__pull_requests__shellchecker]:
  https://img.shields.io/github/issues-pr/paranoid-linux/shellchecker.svg

[badge__main__shellchecker__source_code]:
  https://img.shields.io/github/repo-size/paranoid-linux/shellchecker


[sponsor__shields_io__liberapay]:
  https://img.shields.io/static/v1?logo=liberapay&label=Sponsor&message=paranoid-linux

[sponsor__link__liberapay]:
  https://liberapay.com/paranoid-linux
  "&#x1F4B1; Sponsor developments and projects that paranoid-linux maintains via Liberapay"


[badge_travis_ci]:
  https://travis-ci.com/paranoid-linux/shellchecker.svg?branch=main

[build_travis_ci]:
  https://travis-ci.com/paranoid-linux/shellchecker

