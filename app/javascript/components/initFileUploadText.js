
const initFileUploadText = () => {
  var inputs = document.querySelectorAll( '.custom-upload' );
  Array.prototype.forEach.call( inputs, function( input ) {
    var label = input.previousElementSibling,
                labelVal = label.innerHTML;

    input.addEventListener( 'change', function( e ) {
      var fileName = '';

      if ( this.files && this.files.length > 1 ) {
        fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
      } else {
        fileName = e.target.value.split( '\\' ).pop();
      }

      if ( fileName ) {
        label.innerHTML = 'File name: ' + fileName;
      } else {
        label.innerHTML = labelVal;
      }
    });
  });
};

export { initFileUploadText };
