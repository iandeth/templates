#!/usr/bin/perl -w
use strict;
use JavaScript::Minifier qw/minify/;
open( my $in, shift @ARGV ) or die $!;
print minify( input=>$in );
