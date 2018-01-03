#!/usr/bin/perl -w
use strict;
use Encode qw/from_to/;
use Text::CSV_XS;

my $csvp = Text::CSV_XS->new({ binary=>1 });
while (<$fh>){
    $_ =~ s/[\r\n]+$//;
    from_to $_, 'cp932', 'utf8';
    my $pok = $csvp->parse( $_ );
    if( !$pok ){
        warn $csvp->error_input;
        next;
    }
    my @arr = $csvp->fields;
    use Dumpvalue; Dumpvalue->new->dumpValue( \@arr );
}
