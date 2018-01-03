#!/usr/bin/perl -w
use strict;

my $num = 123456789;
while( $num =~ s/(.*\d)(\d\d\d)/$1,$2/ ){};
print "$num\n";
