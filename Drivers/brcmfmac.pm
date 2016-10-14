# zd1211rw driver for pifimon. 
# for the ZyDAS ZD1211 chipset (rebranded Atheros AR5007UG/AR2524/AR5524)
# widely used in USB wireless devices

# returns signal level in percentage.

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

package Iwlist::brcmfmac;

use strict;
use vars qw(@ISA);

@ISA = qw(Iwlist);



sub handleQuality {
  my $self = shift;
  my $qual = shift;

  my @qualArr = split(' ', $qual);

  my $quality = (split("=", $qualArr[0]))[1];
  my $sigLvl = (split("=", $qualArr[2]))[1];

  $quality = (split(/\//, $quality))[0];

  # crudely convert to dBm
  # $sigLvl = sprintf("%.0f", ($sigLvl * 0.7) - 70);

  return ($quality, $sigLvl);
}