package startup;
use strict;
use CGI ();
CGI->compile(qw/param header/);
use DBI ();
DBI->install_driver('mysql');
use Apache::DBI ();
use URI ();
use URI::Escape ();
use XML::TreePP ();
use JSON::Syck ();
use YAML::Syck ();
use DateTime ();
#use LWP::UserAgent ();
use File::Path ();
use Time::HiRes ();
use List::Util ();
use Hash::Util ();
use Scalar::Util ();

#use lib "/path/to/my/lib";

1;
