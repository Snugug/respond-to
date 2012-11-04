# Respond To

You've always wanted a nice, natural language way to name and remember your breakpoints, and now you can have it! Introducing Respond-to, a compass extension giving you the power of a [Variable Driven respond-to mixin](https://gist.github.com/2493551) for you to use in your projects now!

## Requirements

Respond-to is a Compass extension, so make sure you have [Sass and Compass Installed](http://compass-style.org/install/) in order to use its awesomeness!

Respond-to also requires Sass 3.2, which was just recently released. Respond-to should install Sass 3.2 for you when you install it, but in case you are getting errors, open up your terminal and type the following in:

`gem install sass`

If you are compiling with CodeKit, [Chris Coyier has an awesome writeup](http://css-tricks.com/media-queries-sass-3-2-and-codekit/) on how to get CodeKit playing nice with Sass 3.2.

## Install

`gem install respond-to`

### If creating a new project
`compass create <my_project> -r respond-to`

### If adding to existing project, in config.rb
`require 'respond-to'`

### Import the breakpoint partial at the top of your working file
`@import 'respond-to';`

## API

Respond-to is driven by the `$breakpoints` variable, where your breakpoints go, and the `@include respond-to()` mixin, which builds the media query for you. Any breakpoint you can create using the [Compass Breakpoint Extension](https://github.com/canarymason/breakpoint) can be written using `$breakpoints`, you are essentially substituting individual variables for full string explanations.

### $breakpoints

Each individual entry in `$breakpoints` is made up of two pieces, the string name and the query you'd like to use. The string name must be wrapped in either 'single quotes' or "double quotes", and the query must be wrapped in (parenthesis), and each entry must be comma separated. The string name may contain any characters that a string can contain, including punctuation, capitals, spaces, etc… The string name and the query must be space separated. If you are using the SCSS syntax, each entry may be on a separate line, but if you are using the Sass syntax, all entries must be in one line.

### @include respond-to()

The `@include respond-to()` mixin takes one required and one optional parameter. The first parameter is the case sensitive string name of the query you're looking to call, again either wrapped in 'single quotes' or "double quotes". The second, optional parameter is the media you'd like to use the media query with. This defaults to 'screen', but can be anything you'd like it to be. To change it, after your string name, add a comma and 'single quote' or "double quote" the media you'd like to target.

## Usage Example

```scss
$breakpoints: 'full navigation, large' (700px 800px),
			  'monochrome screen' (monochrome),
			  'monochrome portrait, wide' (700px, orientation portrait, monochrome);

.foo {
  @include respond-to('full navigation, large') {
    content: 'Full Navigation, Large';
  }
}

.bar {
  @include respond-to('monochrome screen', 'screen') {
    content: 'Monochrome Screen';
  }
}

.baz {
  @include respond-to('monochrome portrait, wide', 'print') {
    content: 'Monochrome Portrait, Wide in Print';
  }
}
```

```css
@media (min-width: 700px) and (max-width: 800px) {
  .foo {
    content: 'Full Navigation, Large';
  }
}

@media screen and (monochrome) {
  .bar {
    content: 'Monochrome Screen';
  }
}

@media print and (min-width: 700px) and (orientation: portrait) and (monochrome) {
  .baz {
    content: 'Monochrome Portrait, Wide in Print';
  }
}
```

## Breakpoint API

Because Respond-to is built on top of the [Breakpoint Compass Extension](http://github.com/canarymason/breakpoint), all of the  options that are available to you through Breakpoint are available to you with Respond-to, including the awesome Media Query Contexts. I've reproduced the Breakpoint Options and Media Query Context writeups from the Breakpoint README below.

### Breakpoint Options

Breakpoint provides a few default options that you can change.

* `$breakpoint-default-media` - Defaults to 'all'. If you do not pass a media type into the breakpoint mixin, this is the media type that will be used.
* `$breakpoint-default-feature` - Defaults to 'min-width'. If you write a breakpoint with only a number, this is the feature that is used.
* `$breakpoint-default-pair` - Defaults to 'width'. If you write a breakpoint with two numbers but do not specify the feature, this is the feature that is used.
* `$breakpoint-to-ems` - Defaults to 'false'. If set to true, all pt/px/percent numbers will be converted to em units for better, more accessable media queries.
* `$breakpoint-prefixes` - Defines the prefixes to write for prefixed media features. Defaults to `'webkit' 'moz'`.
* `$breakpoint-prefixed-queries` - Defines what queries should be prefixed. Defaults to `'device-pixel-ratio' 'min-device-pixel-ratio' 'max-device-pixel-ratio'`.

PLEASE NOTE! If you're a savvy reader, you'll have noticed that we've not included `-o-device-pixel-ratio` as a prefixed option, and we would encourage you not to either. Opera has decided that [their implementation should be written as a fraction, not as a decimal](http://dev.opera.com/articles/view/an-introduction-to-meta-viewport-and-viewport/#device-pixel-ratio), and we are currently not prepared to support automatic conversion of decimals to fractions. This leaves us in the position of either supporting only fractions for unprefixed `device-pixel-ratio`, which is counter to the way the two largest browsers support the query, or suggesting that if you want to use `-o-device-pixel-ratio` that you write a separate media query for it, and we've chosen the later.

### Media Query Context

Ever wanted to get the context of a media query from within a mixin or function? Well we have, so we've made that possible! Simply call the `breakpoint-get-context($feature)` function which will either return the contextual value for that feature (`min-width`, `max-width`, etc…) or `false`. You can then do all the awesomeness that you've ever wanted to do with that information.

Caviats with Media Query context:

* If you have `$breakpoint-to-ems` set to true, you will get returns in base ems. You can run non-em based values through `breakpoint-to-base-em($value)` to convert them to base ems.
* If you are testing for a prefixed feature (such as `device-pixel-ratio`), you need to test for the prefixed value (`-webkit-device-pixel-ratio`, `min--moz-device-pixel-ratio`, etc…).

## Comparison with Breakpoint Extension

Both Respond-to and Breakpoint do very similar things, in fact, Respond-to is built on the power of Breakpoint, but there are a few key differences between the two that are worth pointing out.

* Breakpoint relies on variables for naming whereas Respond-to releases on full strings. This means that Respond-to's queries can have more descriptive names than Breakpoint's.
* Because Breakpoint works off of variables and Respond-to works off of a list, you can dynamically generate media queries with Respond-to by appending to the `$breakpoints` variable. Variables currently cannot be dynamically created using Sass, limiting how dynamic media queries can be created using Breakpoint.
* Respond-to relies on a single variable to hold all queries whereas Breakpoint has separate variables per query. This means that Breakpoint's queries are easier to sightread and version when using the Sass syntax.
* Both breakpoint and respond-to use the same media query rendering backend, so the core syntax for each query is identical between both of them.

## License

Copyright (c) 2012 [Sam Richard](http://snugug.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 