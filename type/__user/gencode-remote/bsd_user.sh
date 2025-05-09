#!/bin/sh -e
#
# 2025 Dennis Camera (dennis.camera at riiengineering.ch)
#
# This file is part of skonfig-base.
#
# skonfig-base is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# skonfig-base is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with skonfig-base. If not, see <http://www.gnu.org/licenses/>.
#

# NetBSD and OpenBSD use the user(8) wrapper utility, but are
# otherwise the same as user{add,mod,del}(8).  We import usermod.sh and
# overwrite the functions accordingly.

# shellcheck source=SCRIPTDIR/usermod.sh
. "${__type:?}/gencode-remote/usermod.sh"

do_create_user() {
	# usage: do_create_user username property=value

	__do_user=${1:?}
	shift

	printf 'user add %s %s\n' \
		"$(properties_to_usermod_argv "$@")" \
		"$(quote_ifneeded "${__do_user:?}")"

	unset -v __do_user
}

do_modify_user() {
	# usage: do_modify_user username property=new-value

	__do_user=${1:?}
	shift

	printf 'user mod %s %s\n' \
		"$(properties_to_usermod_argv "$@")" \
		"$(quote_ifneeded "${__do_user:?}")"

	unset -v __do_user
}

do_delete_user() {
	# usage: do_delete_user username property[=value]

	__do_user=${1:?}
	shift

	printf 'user del %s %s\n' \
		"$(properties_to_usermod_argv "$@")" \
		"$(quote_ifneeded "${__do_user:?}")"

	unset -v __do_user
}
