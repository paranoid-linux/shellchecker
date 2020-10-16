#
#    Make variables to satisfy conventions
#
NAME=shellchecker
VERSION=0.0.1
PKG_NAME=$(NAME)-$(VERSION)


# Install/Uninstall make script for `shellchecker` project
# Copyright (C) 2020 S0AndS0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


#
#    Make variables that readers &/or maintainers may wish to modify
#
## If /usr/local/sbin is not available, then change the following to
##  access scripts by name to a path available to your PATH variable
SCRIPT_INSTALL_DIR = /usr/local/sbin
SCRIPT_NAME = shellchecker


#
#    Make variables set upon run-time
#
## Obtain directory path that this Makefile lives in
##  Note ':=' is to avoid late binding that '=' entails
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
## Detect Operating System
ifeq '$(findstring :,$(PATH))' ';'
	__OS__ := Windows
else
	__OS__ := $(shell uname 2>/dev/null || echo 'Unknown')
	__OS__ := $(patsubst CYGWIN%,Cygwin,$(__OS__))
	__OS__ := $(patsubst MSYS%,MSYS,$(__OS__))
	__OS__ := $(patsubst MINGW%,MSYS,$(__OS__))
endif


#
#    Make options/commands
#
.PHONY: install uninstall upgrade git-pull list
.SILENT: install uninstall
.ONESHELL: install

uninstall: SHELL := /bin/bash
uninstall: ## Removes symbolic links to project script
	[[ -L "$(SCRIPT_INSTALL_DIR)/$(SCRIPT_NAME)" ]] && { rm -v "$(SCRIPT_INSTALL_DIR)/$(SCRIPT_NAME)"; }

install: SHELL := /bin/bash
install: ## Symbolically links to project script
	[[ -L "$(SCRIPT_INSTALL_DIR)/$(SCRIPT_NAME)" ]] || { ln -sv "$(ROOT_DIR)/$(SCRIPT_NAME)" "$(SCRIPT_INSTALL_DIR)/$(SCRIPT_NAME)"; }

upgrade: ## Runs targets -> uninstall git-pull install
upgrade: | uninstall git-pull install

git-pull: SHELL := /bin/bash
git-pull: ## Pulls updates from default upstream Git remote
	cd "$(ROOT_DIR)"
	git pull

list: SHELL := /bin/bash
list: ## Lists available make commands
	gawk 'BEGIN {
		delete matched_lines
	}
	{
		if ($$0 ~ "^[a-z0-9A-Z-]{1,32}: [#]{1,2}[[:print:]]*$$") {
		matched_lines[length(matched_lines)] = $$0
		}
	}
	END {
		print "## Make Commands for $(NAME) ##\n"
		for (k in matched_lines) {
			split(matched_lines[k], line_components, ":")
			gsub(" ## ", "    ", line_components[2])
			print line_components[1]
			print line_components[2]
			if ((k + 1) != length(matched_lines)) {
				print
			}
		}
	}' "$(ROOT_DIRECTORY)/Makefile"

