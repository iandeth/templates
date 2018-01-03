#!/usr/bin/perl -w
use strict;
use Imager;
use Encode qw/decode/;
use FindBin;

my $dir = $FindBin::RealBin;
my $img = Imager->new( xsize=>200, ysize=>100, channels=>3 );

### background fill
$img->box( color=>'FF0000', filled=>1 );

### draw text
my $fontfile = $dir . '/KozGoStd-Regular.otf';
#$fontfile = $dir . '/VL-PGothic-Regular.ttf';
# prepare font
my $font = Imager::Font->new(
    type  => 'ft2',
    file  => $fontfile,
    index => 0,
    aa    => 1,
    utf8  => 1,
) or die $Imager::ERRSTR;
# and draw text
my $text = shift || "あいうえお、か「きくけ」";
$text = decode 'utf8', $text;
$img->string( 
    font  => $font,
    x     => 10,
    y     => 10,
    align => 0,
    color => '000000',
    size  => 16,
    text  => $text,
    vlayout => 1,  # for 縦書き
) or die $img->errstr;

### write to file
my $file = $dir . '/imager-draw-text.png';
$img->write( file=>$file, type=>'png' ) or die $img->errstr;
print "jpeg file written:\n$file\n";
