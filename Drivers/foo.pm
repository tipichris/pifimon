# an example pifimon driver named foo

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

package Iwlist::foo;

use strict;
use vars qw(@ISA);

@ISA = qw(Iwlist);

# This driver returns signal strength in percent
sub getsigunits {
  return 'pct';
}

# Override handleQuality. 
sub handleQuality {
  my $self = shift;
  my $qual = shift;

  my @qualArr = split(" ", $qual);

  my $quality = (split(":", $qualArr[0]))[1];
  # my $sigLvl = (split(":", $qualArr[2]))[1];
  my $sigLvl = 15 * (split(/\//, $quality))[0];
  $self->{'data'}->{$self->{'idx'}}->{'quality'} = $quality;
  $self->{'data'}->{$self->{'idx'}}->{'sigLvl'} = $sigLvl;
}


