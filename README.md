# RequireEverything

Inspired by [Building the Next SoundCloud](http://backstage.soundcloud.com/2012/06/building-the-next-soundcloud/),
I set out to create a similar workflow in Rails, which actually seems to be a nice fit. Features are coming as I
need them in production, but generally this is what's goin down:

> All Javascript, Templates and CSS are modularized via [RequireJS](http://requirejs.org), and are required when/where
> needed.

RequrieEverything is built around [Backbone.js](http://backbonejs.org), [Handlebars.js](http://handlebarsjs.com/)
and [LESS](http://lesscss.org/). Intentionally, there isn't too much magick, but RE will automatically wrap boilerplates
around your stylesheets and templates so you don't have to.

In order to not conflict or nulify other template engines, extensions for templates and styles are prefixed with "re".

## .rehandlebars

Your handlebars templates are written as you would expect (no extra nonsense).

```handlebars
<div id="{{id}}-foo">
  {{name}}
</div>
```

RequireEverything will then automatically wrap the template with the necessary loading boilerplate.

```javascript
// for up-to-date code, read the source

define([], function (require) {
  // instantiate Handlebars template out of 
  return Handlebars.compile("<div id=\"{{id}}-foo\">{{name}}</div>");
});
```

## .reless

Compiles [LESS](http://lesscss.org/) into a javascript wrapper:


```javascript
// for up-to-date code, read the source

define(function (require) {
  var style = document.createElement('style');
  style.appendChild(
    // place compiled CSS into `style`
    document.createTextNode("...");
  );
  
  return style;
});
```
