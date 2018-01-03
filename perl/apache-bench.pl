#!/usr/bin/perl -w
use strict;
use HTTPD::Bench::ApacheBench;
use Getopt::Long;

my $conc   = 5;
my $order  = "depth_first";  # or "breadth_first"
my $repeat = 10;
GetOptions(
    "concurrency=i" => \$conc,
    "order=s"       => \$order,
    "repeat=i"      => \$repeat,
);

my $url = "http://www.google.com/search?rls=ja-jp&ie=UTF-8&oe=UTF-8&q=";
my @urls = (
    $url . "foo",
    $url . "bar",
    $url . "buz",
);

my $b = HTTPD::Bench::ApacheBench->new;
$b->concurrency( $conc );
my $run1 = HTTPD::Bench::ApacheBench::Run->new ({
    repeat => $repeat,
    urls   => \@urls,
    order  => $order,
});
$b->add_run( $run1 );
$b->execute;

# calculate hits/sec
print "concurrency: $conc\n";
print "total requests sent: ", $b->total_requests_sent, "\n";
print "total time: ", int( $b->total_time / 1000) , " sec\n";
print int (1000*$b->total_requests/$b->total_time), " req/sec\n";
print "error requests: ", $b->total_responses_failed, "\n";

# show request times (in ms) for $run1, 1st repetition
#print join(', ', @{$run1->request_times}) . "\n";
