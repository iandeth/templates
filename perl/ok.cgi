#!/usr/bin/perl -w
use strict;
use CGI;
use Dumpvalue;

my $q = CGI->new;
print $q->header;
print $q->start_html;
print '<pre>';
Dumpvalue->new->dumpValue( \%::ENV );
print '</pre>';
print $q->end_html;
