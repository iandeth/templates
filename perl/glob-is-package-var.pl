#!/usr/bin/perl -w
use strict;
use File::Temp qw/tempfile/;

# getting ready
my $file = ( tempfile )[1];
open FILE, '>', $file or die $!; 
print FILE "pass_glob\n";
print FILE "nopass_glob\n";
close FILE;

# lets check
open FILE, '<', $file or die $!; 
pass_glob( *FILE );
nopass_glob();
# this will not work
# Other::nopass_glob();

# instead, this will work
open( Other::FILE, '<', $file ) or die $!; 
Other::nopass_glob();

# passing filehandle as glob
sub pass_glob {
    my $glob = shift;
    my $line = <$glob>;
    print $line; # hoge
}
sub nopass_glob {
    my $line = <FILE>;
    print $line;  # fuga
}

# is FILE actually a global var?
package Other;
sub nopass_glob {
    my $line = <FILE>;
    print $line;  # fuga
}

# conclusion
# glob is a package scoped variable
