(function ($) {

var RatingBarShow = function( element, options ) {

   var $me = $( element ).addClass( 'star-ctr' );

   var $bg, $fg, steps, wd, cc,
       sw, fw, cs, cw, ini, supervl = 0, superow = 0;

   $bg = $me.children( 'ul' );
   $avg = $me.attr( 'avg');
   $superwidth = 0
   switch ($avg)
   {
      case '0.5': $superwidth = 14
      break;
      case '1.0': $superwidth = 28
      break;
      case '1.5': $superwidth = 46
      break;
      case '2.0': $superwidth = 60
      break;
      case '2.5': $superwidth = 78
      break;
      case '3.0': $superwidth = 92
      break;
      case '3.5': $superwidth = 110
      break;
      case '4.0': $superwidth = 124
      break;
      case '4.5': $superwidth = 142
      break;
      case '5.0': $superwidth = 156
      break;
      default: $superwidth = 0
   }
   $fg = $bg.clone().addClass( 'star-fg' ).css( 'width', $superwidth ).appendTo( $me );
   $bg.addClass( 'star-bg' );

   function initialize() {

      ini = true;

      // How many rating elements
      cc = $bg.children().length;

      steps = Math.floor( +( $me.attr( 'data-steps' ) || 0 ) );

      // Total width of the bar
      wd = $bg.width();

   }
}



$.fn.ratingbarshow = function ( option ) {

   return this.each(function () {

      var $this   = $( this )
      var data    = $this.data( 'osb.ratingbarshow' )
      var options = typeof option == 'object' && option

      if ( !data ) $this.data( 'osb.ratingbarshow', ( data = new RatingBarShow( this, options ) ) )

   })
}

$.fn.ratingbarshow.Constructor = RatingBarShow

})(jQuery);
