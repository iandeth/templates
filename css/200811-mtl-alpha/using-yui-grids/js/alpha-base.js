(function($) {
    var console = window.console || { log: function (){} };
    if( typeof jQuery != 'function' ){
        console.log( 'jQuery is required for alpha-layout.js' );
        return;
    }

    Alpha = function() {};
    Alpha.Layout = function() {
        this.initialize.apply( this, arguments );
    };
    Alpha.Layout.prototype = {
        initialize: function( a ) {
            a = $.extend({
                id: undefined,
                debug: false
            }, a );
            if( a.id ){
                this.tgt = $( '#' + a.id );
            }else{
                this.tgt = $( 'div:first' );
            }
            if( this.tgt.length == 0 ){
                console.log( 'Layout: target element not found' );
                return this;
            }
            this.debug = a.debug || false;
            this.bd = $( '#bd' );
            this.ft = $( '#ft' );
        },
        enable_height_auto_resize: function( a ) {
            a = $.extend({
                once_only: false,
                overflow: 'auto',
                min_height: 200
            }, a );
            // something is wrong with IE6, so disable it
            if( $.browser.msie && $.browser.version == '6.0' ){
                return false;
            }
            // yui blocks inside #bd to be stretched
            var self = this;
            // resolve body and tgt's margin and padding
            var b = $( 'body' );
            var t = this.tgt;
            var bm = parseInt( b.css( 'margin-bottom'  ) || 0 );
            var bp = parseInt( b.css( 'padding-bottom' ) || 0 );
            var tm = parseInt( t.css( 'margin-bottom'  ) || 0 );
            var tp = parseInt( t.css( 'padding-bottom' ) || 0 );
            var bottom_white_space = bm + bp + tm + tp;
            var yui_bs = this.bd.find( '.yui-b' );

            if( a.overflow ){
                yui_bs.each(function() {
                    $( this ).css( 'overflow', a.overflow );
                });
            }
            var sbd = function() {
                return self.stretch_bd_height({
                    target: yui_bs,
                    bottom_white_space: bottom_white_space,
                    min_height: a.min_height
                });
            };
            if( !a.once_only ){
                $( window ).resize( sbd ); // register event handler
            }
            sbd();  // exec once for window.load init
        },
        stretch_bd_height: function( a ) {
            a = $.extend({
                target: [],
                bottom_white_space: 0,
                min_height: 0
            }, a );
            var vwp = $( window ).height(); // view port height
            var doc = this.tgt.height();    // layout height
            if( doc > vwp ){
                // return;  // do nothing if doc is full of content
            }
            // bd top Y position
            var bd = this.bd;
            var bd_top = bd.offset().top || 0;
            // bd bottom Y stretched position
            var ft_h = this.ft.outerHeight({ margin:true }) || 0;
            var bd_btm = vwp - ( ft_h + a.bottom_white_space );
            // bd stretched height
            var bd_outer = bd.outerHeight({ margin:true }) - bd.height();
            var unknown = 15;  // avoid displaying of scroll bars
            var ftpb = parseInt( $( '#ft-inner' ).css( 'padding-bottom' ) ) || 0;
            if( ftpb ){
                unknown = unknown - ftpb;
            }
            var bd_h = bd_btm - bd_top - bd_outer - unknown;
            if( bd_h < a.min_height ){
                bd_h = a.min_height;
            }
            a.target.each(function() {
                $( this ).height( bd_h );
            });
            if( this.debug ){
                console.log({
                    vwp: vwp,
                    bd_top: bd_top,
                    bd_btm: bd_btm,
                    bd_outer: bd_outer,
                    ft_h: ft_h,
                    bd_h: bd_h,
                    bottom_white_space: a.bottom_white_space
                });
            }
        }
    };
})( jQuery ); 

