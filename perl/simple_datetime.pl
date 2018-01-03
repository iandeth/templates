#!/usr/bin/perl -w
use strict;

sub get_datetime {
    my $self = shift;
    my ($s,$mi,$h,$d,$m,$y) = ( localtime() )[0 .. 5];
    $y += 1900; $m += 1;
    $m  = sprintf '%02d', $m;
    $d  = sprintf '%02d', $d;
    $h  = sprintf '%02d', $h;
    $mi = sprintf '%02d', $mi;
    $s  = sprintf '%02d', $s;
    return {
        y => $y, m  => $m,  d => $d,
        h => $h, mi => $mi, s => $s,
        ymd => "$y$m$d",
        hms => "$h$mi$s",
    };
}

