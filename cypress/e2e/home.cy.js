// Good day,
// this tests file doesn't cover nearly no tests.
// I've just started the functional tests feature,
// and these tests are just the placeholders for the .html examples files
// in the root of the sandbox.brightday.email to improve the functional tests later.



let examplesUrls = [
  '/favicon.ico',
  '/tr2ee.html',
  '/ExampleSimple_package_ResponsiveSizes.html'
];



async function responseCodes() {

  let response = new Object();

  for ( let url of examplesUrls ) {

    try {
      response = await cy.request( url );
      cy.log( url );
      expect( response.status ).to.eq( 200 );
    } catch ( e ) {}

  }

  return 2;
}



describe( 'Examples', () => {

  it( 'Examples responses valid', () => {

    responseCodes()
      .then (
        ( retVal ) => { cy.log( retVal ); }
      );
  });

});



describe( 'Homepage', () => {
  it( 'loads and contains expected text', () => {
    cy.visit( '/' );
    cy.contains( 'favicon.ico' );
  });
});



//describe( 'Example_EmailHtmlInliner_Images', () => {
//  it( '', () => {
//    cy.visit( '/Example_EmailHtmlInliner_Images.html' );
//    cy.contains( 'Good day' );
//  });
//});
//
//


