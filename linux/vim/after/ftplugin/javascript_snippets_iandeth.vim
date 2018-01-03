if !exists('loaded_snippet') || &cp
    finish
endif
let s = g:snip_start_tag
let e = g:snip_end_tag

exe "Snippet var          var ".s."n".e."  = ".s."v".e.";".s.e
exe "Snippet func         function ".s."name".e." ( ".s."args".e." ){<CR>".s.e."<CR>}".s.e
exe "Snippet function     function ".s."name".e." ( ".s."args".e." ){<CR>".s.e."<CR>}".s.e
exe "Snippet afunc        function ( ".s."args".e." ){<CR>".s.e."<CR>}".s.e
exe "Snippet class        ".s."className".e." = function (){<CR>this.initialize.apply( this, arguments );<CR>};<CR>".s."className".e.".prototype = {<CR><BS><Tab>initialize: function (){<CR><BS><BS><BS>".s.e."<CR><BS><BS>}".s.e."<CR>};"
exe "Snippet namespace    if( typeof ".s."className".e." != \"function\" ){<CR>".s."className".e." = function (){};<CR>}".s.e
exe "Snippet self         var self = this;".s.e
exe "Snippet log          if( typeof console == \"object\" ){<CR>console.log( ".s."obj".e." );<CR>}".s.e
exe "Snippet error        if( typeof console == \"object\" ){<CR>console.erro( ".s."obj".e." );<CR>}".s.e
exe "Snippet lex          (function (){<CR><BS><Tab>".s.e."<CR><BS>})();".s.e

" jQuery
exe "Snippet $            $( ".s."target".e." )".s.e
exe "Snippet $(           $( ".s."target".e." )".s.e
exe "Snippet $(func       $(function (){<CR><BS>".s.e."<CR><BS>});".s.e
exe "Snippet $.getJSON    $.getJSON( ".s."url".e.", function (r){<CR><BS>".s.e."<CR><BS>});".s.e
exe "Snippet each         each( ".s."obj".e.", function (i,v){<CR><BS>".s.e."<CR><BS>});".s.e
exe "Snippet eh           ".s."eventHandler".e."(function (e){<CR><BS>".s.e."<CR>return false;<CR><BS>})".s.e
exe "Snippet }).eh        }).".s."eventH".e."(function (e){<CR>".s.e."<CR>return false;<CR><BS>})".s.e
exe "Snippet css          css({<CR><BS>'".s."key".e."' : '".s."val".e."'".s.e."<CR><BS>})".s.e
