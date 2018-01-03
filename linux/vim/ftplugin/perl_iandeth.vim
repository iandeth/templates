" debug method
iab <buffer> #d use Dumpvalue; Dumpvalue->new->dumpValue( ); die;<Esc>hhhhhhhi

" Add ':' to the keyword characters. Tokens like 'File::Find' are recognized as one keyword
setlocal iskeyword+=:

" fold by syntax
setlocal foldmethod=syntax

" for perl-support plugin
" folding
"let perl_fold=1
"let perl_fold_blocks=1
" comment info
"let g:Perl_AuthorName   = 'Toshimasa Ishibashi'     
"let g:Perl_AuthorRef    = 'BASHI'                         
"let g:Perl_Company      = ''
"let g:Perl_Email        = 'bashi@cpan.org'            
" navigate through POD docs
" need ~/.ctags customized, will not work with POD's after __END__ block
"let tlist_perl_settings = 'perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD'
