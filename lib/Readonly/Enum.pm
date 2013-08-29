package Readonly::Enum;

use strict;
use warnings;

use version 0.77; our $VERSION = version->declare("v0.1.0");

use Scalar::Readonly qw/ readonly_on /;

sub Readonly::Enum {

    my @vals  = grep { defined $_ } @_;

    my $i = 0;

    my $start = 0;

    for($i=0; $i<@_; $i++) {

	last if defined $_[$i];

	$start = @vals ? (shift @vals) : ++$start;

	readonly_on($_[$i] = $start);

    }
}


1;
