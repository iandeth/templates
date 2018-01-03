if !exists('loaded_snippet') || &cp
    finish
endif
let s = g:snip_start_tag
let e = g:snip_end_tag

exe 'Snippet dd     die("<pre>\n".print_r( '.s.'var'.e.', TRUE )."</pre>\n");'
exe 'Snippet dw     error_log(print_r( '.s.'var'.e.', TRUE ));'
exe 'Snippet dp     file_put_contents( "/tmp/php_iandeth.log", print_r( '.s.'var'.e.', TRUE ), FILE_APPEND | LOCK_EX ) or die("dump failed");'
exe 'Snippet db     BP_Dev_ZendDb::traceStart($this->db);<CR>BP_Dev_ZendDb::traceEnd();'
exe 'Snippet <?=    <?= $this->escape( '.s.'var'.e.' ) ?>'.s.e
exe 'Snippet <?p    <?php '.s.'var'.e.' ?>'.s.e
