#!/usr/bin/perl -w
use strict;
use Dumpvalue;
use CGI qw/-compile param/;

package Hoge;
sub fuga { print 1 }
our $fuga = 2;
open our $hoge, '>/dev/null';
my %opt = ( globPrint => 1 );
Dumpvalue->new( %opt )->dumpValue( \*Hoge:: );

package main;
use Devel::Symdump;
my $sd = Devel::Symdump->new( 'Hoge' );
print $sd->as_string;
