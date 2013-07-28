var Blog = Blog || {};

Blog.articles = {   // controller name
  init : function(){    // Always executed
    console.log("Init articles");
    this.parser = new Showdown.converter();
  },

  parser : null,

  edit : function(){  // Action name
    console.log("Init articles - Edit");
    this.initListeners();
  },

  new : function(){
    console.log("Init articles - New");
    this.initListeners();
  },

  initListeners : function(){
    console.log("Init Listeners");
    var title_preview = $("#title-preview"),
      body_preview = $("#body-preview"),
      title = $("#article-title"),
      body = $("#article-body");
    var self = this;

    $(window).keyup(function(){
      title_preview.html($(title).val());
      var html = self.parser.makeHtml($(body).val());
      body_preview.html(html);
    });

  }
}