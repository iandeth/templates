#!/usr/bin/perl -w
use strict;
use URI;

# HOW TO HANDLE URL ENCODED STRINGS
{
    # just use URI::Escape;
    require URI::Escape;
    URI::Escape->import;
    print uri_escape( 'あ' ), "\n";
    print uri_unescape( '%E3%81%84' ), "\n";
}
{
    # or use CGI::Util
    require CGI::Util;
    CGI::Util->import(qw/escape unescape/);
    print escape( 'あ' ), "\n";
    print unescape( '%E3%81%84' ), "\n";
}
{
    # URI basic
    my $uri = URI->new( '?q=あ' );
    print $uri->query, "\n";
}
{
    # set key/value afterwards
    my $uri = URI->new;
    $uri->query_form( q=>'あ', r=>'い' );
    print $uri->query, "\n";
}
{
    # query_form can be used only once
    my $uri = URI->new;
    $uri->query_form( q => 'あ' );
    $uri->query_form( r => 'い' );  # q is now gone
    print $uri->query, "\n";
}
{
    # so this is an appendable way
    require URI::QueryParam;
    my $uri = URI->new;
    $uri->query_param( q => 'あ' );
    $uri->query_param( r => 'い' );
    print $uri->query, "\n";
}
{
    # decoding
    require URI::QueryParam;
    my $uri = URI->new( '?q=%E3%81%82&q=2' );
    my @arr = $uri->query_param( 'q' );
    print join( ' ', @arr ), "\n";
}
