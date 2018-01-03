#!/usr/bin/perl -w
use strict;
use Location::GeoTool;

my $lat = 34.99484751565505;
my $lng = 135.78494310379028;

my $gt = Location::GeoTool->new({ changeMyself=>1 });
$gt->set_coord( $lat, $lng, 'wgs84', 'degree' );

$gt->format_second;
$gt->datum_tokyo;
( $lat, $lng ) = $gt->array;

$lat = int $lat * 1000;  # to milli sec
$lng = int $lng * 1000;
print "lat: $lat\nlng: $lng\n";
