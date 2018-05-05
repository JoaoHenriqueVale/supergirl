$(document).ready(function() {
  $( '[data-role="ratingbar"]' )
     .ratingbar()
     .click(function() {
      questgirl = $( this ).attr( 'questgirl' );
      $("."+questgirl).val($( this ).attr( 'data-value' ));
      return false;
  });
});
