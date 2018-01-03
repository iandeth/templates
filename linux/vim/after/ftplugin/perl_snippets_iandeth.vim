if !exists('loaded_snippet') || &cp
    finish
endif
let s = g:snip_start_tag
let e = g:snip_end_tag

exe "Snippet #!       #!/usr/bin/perl -w<CR><BS>use strict;<CR>".s.e
exe "Snippet sub      sub ".s."func".e." {<CR>my $self = shift;<CR>".s.e."<CR>}"
exe "Snippet class    package ".s."ClassName".e.";<CR>use base qw/".s."ParentClass".e."/;<CR>use strict;<CR><CR>sub new {<CR>my $class = shift;<CR>my $p = {<CR>".s."".e."<CR>};<CR>my $self = bless $p, $class;<CR>return $self;<CR>}".s.e."<CR><CR>1;"
exe "Snippet super    my $super = $class->SUPER::new( @_ );".s.e

exe "Snippet my       my ".s."n".e." = ".s."v".e.";<CR>".s.e
exe "Snippet if       if ( ".s."cond".e." ){<CR>".s.e."<CR>}".s.e
exe "Snippet ife      if ( ".s."cond".e." ){<CR>".s.e."<CR>}else{<CR>".s.e."<CR>}".s.e
exe "Snippet ifee     if ( ".s."cond".e." ){<CR>".s.e."<CR>}elsif ( ".s."cond2".e." ){<CR>".s.e."<CR>}else{<CR>".s.e."<CR>}".s.e
exe "Snippet unless   unless ( ".s."cond".e." ){<CR>".s.e."<CR>}".s.e
exe "Snippet for      for ( my $".s."var".e." = 0; $".s."var".e." < ".s."expr".e."; $".s."var".e."++ ){<CR>".s.e."<CR>}".s.e
exe "Snippet fore     foreach my $".s."var".e." ( ".s."obj".e." ){<CR>".s.e."<CR>}".s.e
exe "Snippet foreach  foreach my $".s."var".e." ( ".s."obj".e." ){<CR>".s.e."<CR>}".s.e
exe "Snippet while    while ( ".s."cond".e." ){<CR>".s.e."<CR>}".s.e
exe "Snippet xif      ".s."expr".e." if ".s."cond".e.";".s.e
exe "Snippet xfore    ".s."expr".e." foreach ".s."obj".e.";".s.e
exe "Snippet xwhile   ".s."expr".e." while ".s."cond".e.";".s.e
exe "Snippet xunless  ".s."expr".e." unless ".s."cond".e.";".s.e

exe "Snippet eval     eval {<CR>".s.e."<CR>};<CR>if ( $@ ){<CR>".s.e."<CR>}".s.e
exe "Snippet open     open my $fh, '".s."rwa".e."', ".s."file".e." or die $!;".s.e
exe "Snippet openr    open my $fh, '".s."rwa".e."', ".s."file".e." or die $!;<CR>my $s = do { local $/ = undef; <$fh> };".s.e
exe "Snippet printn   print ".s."obj".e.", \"\\n\";".s.e
exe "Snippet dump     use Dumpvalue; Dumpvalue->new->dumpValue( ".s."obj".e." );".s.e
exe "Snippet dumper   use Data::Dumper; ".s."die".e." Dumper( ".s."obj".e." );".s.e
