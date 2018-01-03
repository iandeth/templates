#!/usr/bin/perl -w
use strict;
use File::Find;

find({
    wanted => sub {
        return if $File::Find::dir =~ /tests/;
        return if $File::Find::name !~ /\.html$/;
        warn $File::Find::name;
    },
    no_chdir => 1,
}, '.' );
