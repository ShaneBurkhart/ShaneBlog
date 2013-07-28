// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require showdown
//= require_tree .


////*************** Template *****************/////
/*
var Blog = Blog || {};

Blog.marketing = {   // controller name
  init : function(){    // Always executed
    console.log("Init marketing");
  },

  employee : function(){  // Action name

  }
}*/

var Blog = Blog || {};

Blog.NAV_BAR_PADDING = 51;
Blog.JOB_LISTING_ZOOM = 14;

Blog.common = {   // App wide code and sets up namespace
  init: function() {
    // application-wide code
    console.log("Initializing App JS...");
  }
};

/////**************DON'T TOUCH BELOW!*********////

UTIL = {
  exec: function( controller, action ) {
    var ns = Blog,
        action = ( action === undefined ) ? "init" : action;

    if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {
      ns[controller][action]();
    }
  },

  init: function() {
    var body = $("body"),
        controller = body.data( "controller" ),
        action = body.data( "action" );

    UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
  }
};

$( document ).ready(function(){
  UTIL.init();
});