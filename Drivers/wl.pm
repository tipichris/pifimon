# wl driver for pifimon, for Broadcom cards
# Doesn't override any methods as the default was built around wl

# This file is part of pifimon, a Perl script for monitoring wireless
# networks under Linux
#
# Copyright 2010 Chris Hastie (http://www.oak-wood.co.uk/)
#
# pifimon is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# pifimon is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with pifimon.  If not, see <http://www.gnu.org/licenses/>.

package Iwlist::wl;

use strict;
use vars qw(@ISA);

@ISA = qw(Iwlist);