#!/usr/bin/perl -w
use strict;
use CGI qw/escapeHTML/;

my $s = q{
c-wh=200,100&e1-type=img&e1-url=http%3A%2F%2Fk.yimg.jp%2Fimages%2Ftop%2Fsp%2Flogo.gif&e1-xy=10,10
};
print escapeHTML( $s ), "\n";
