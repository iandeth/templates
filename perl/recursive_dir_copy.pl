#!/usr/bin/perl -w
use strict;
use FindBin;
use File::Find;
use File::Spec;
use File::Path;
use File::Copy;

my $from_dir = "$FindBin::RealBin/from_dir";
my $to_dir   = "$FindBin::RealBin/to_dir"; 
find(sub {
    my $t = $File::Find::name;
    return if $t =~ m{/\.svn};
    my $type = ( -d $t )? 'dir' : 'file';
    my $rel = File::Spec->abs2rel( $t, $from_dir );
    my $path = "$to_dir/$rel";
    if( $type eq 'dir' ){
        mkpath $path, 0;
    }else{
        copy $t, $path;
    }
}, $from_dir );

