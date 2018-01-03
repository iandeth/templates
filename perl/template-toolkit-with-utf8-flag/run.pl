#!/usr/bin/perl -w
use strict;
use utf8;
binmode STDOUT, ':utf8';
use FindBin;
use Template;  # with version >= '2.20';

our $TT;
sub tt {
    my $paths = shift || [];  # INCLUDE_PATH
    my $tt = $TT ||= Template->new({
        LOAD_TEMPLATES => [
            Template::Provider->new({
                POST_CHOMP => 1,
                STAT_TTL   => 60 * 60 * 24 * 365,  # if ENV == production (cache expire stat をしない)
                ENCODING   => 'utf8',
                # DEBUG      => Template::Constants::DEBUG_PROVIDER,
            }),
        ],
    });
    ## INCLUDE_PATH を毎回指定・変更できるように
    my $tp = $tt->context->{LOAD_TEMPLATES}[0];
    $tp->include_path( $paths );
    return $tt;
}

my $v = {
    foo => '日本語',
    bar => 'だ〜よ',
};
my $tt = tt([
    "$FindBin::RealBin/tmpl",
]);
$tt->process( 'index.tmpl', $v ) || die $tt->error, "\n";


## include path の変更が正常動作してる事を確認
print "==========\n";
$tt = tt([
    "$FindBin::RealBin/tmpl2",
]);
$tt->process( 'index.tmpl', $v ) || die $tt->error, "\n";
