# rt2860 driver for pifimon

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

package Iwlist::rt2860;

use strict;
use vars qw(@ISA);

@ISA = qw(Iwlist);

# need to redefine the regexs because rt2860 reports Channel, 
# not Frequency
sub init_re {
  my $self = shift;
  $self->{'re'}->{'cell'} = qr/^\s*Cell [0-9][0-9]/;
  $self->{'re'}->{'essid'} = qr/^\s*ESSID/;
  $self->{'re'}->{'key'} = qr/^\s*Encryption key/;
  $self->{'re'}->{'quality'} = qr/^\s*Quality/;
  $self->{'re'}->{'enctype'} = qr/^\s*IE: WPA .+ [0-9]/;
  $self->{'re'}->{'authtype'} = qr/^\s*Authentication Suites/;
  $self->{'re'}->{'frequency'} = qr/^\s*Channel/;
  return 1;
}


sub handleChannel {
  my $self = shift;
  my $line = shift;
  my $channel = (split(":", $line))[1];
  $self->{'data'}->{$self->{'idx'}}->{'channel'} = $channel;
}