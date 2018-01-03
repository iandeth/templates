#!/usr/bin/perl -w
use strict;
use HTML::Parser;
# http://search.cpan.org/dist/HTML-Parser

my $html = <<"EOS";
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=Shift_JIS">
</head>
<body>
	<a href="http://hoge.com/" target="hoge">hoge_link</a>
	<a target="fuga" href="http://fuga.com/">fuga_link</a>
	<a href="http://fugo.com/" target="fugo" attr2="fugofugo">fugo_link</a>
</body>
</html>
EOS

my $h = sub {
	use Dumpvalue; Dumpvalue->new->dumpValue( \@_ );
};
my $p = HTML::Parser->new(
	start_h     => [ $h, "tagname, attr" ],
	report_tags => [qw/a/],
);
$p->parse( $html );

