// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

function capitalize(string){
  return string.replace( /(^|\s)([a-z])/g , function(m,p1,p2){ return p1+p2.toUpperCase(); } );
};

function supplant(string, o){
  return string.replace(/{([^{}]*)}/g,
    function (a, b) {
      var r = o[b];
      return typeof r === "string" || typeof r === "number" ? r : a;
    }
  );
};

function encrypt(string){
  return hex_sha512( string.toLowerCase() ) ;
}