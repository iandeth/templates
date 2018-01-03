#!/usr/bin/perl -w
use strict;
use Image::ExifTool qw/:Public/;

my $file = shift or die "pass photo file as argv\n";
my $exif = ImageInfo $file;
use Dumpvalue; Dumpvalue->new->dumpValue( $exif );

