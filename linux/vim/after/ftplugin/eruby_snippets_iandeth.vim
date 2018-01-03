if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet <% <% ". st.et. " %>".st.et 
exec "Snippet <%= <%= ". st.et. " %>".st.et 
exec "Snippet % <% ". st.et. " %>".st.et 
exec "Snippet = <%= ". st.et. " %>".st.et 
exec "Snippet h <%=h ". st.et. " %>".st.et 
exec "Snippet l <%= link_to \"". st.et. "\", :action => \"". st.et . "\" %>".st.et 
