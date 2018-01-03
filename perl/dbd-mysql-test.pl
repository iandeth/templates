#!/usr/bin/perl -w
use strict;
use DBI;
use Dumpvalue;

my $database = "mysql";
my $hostname = "localhost";
my $port     = "3306";
my $user     = "root";
my $passwd   = "";
my $dsn      = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $option   = {
    RaiseError => 1,
};
my $dbh = DBI->connect( $dsn, $user, $passwd );

my $sth = $dbh->prepare( "SHOW TABLES" );
$sth->execute;
my @arr;
while ( my $res = $sth->fetchrow_arrayref ){
    push @arr, $res->[0];
}
Dumpvalue->new->dumpValue( \@arr );
