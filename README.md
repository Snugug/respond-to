# Respond To

You've always wanted a nice, natural language way to name and remember your breakpoints, and now you can have it! Introducing Respond To, a compass extension giving you the power of a Variable Driven respond-to mixin (https://gist.github.com/2493551) for you to use in your projects now!

## Install

`sudo gem install respond-to`

#### If creating a new project
`compass create <my_project> -r respond-to`

#### If adding to existing project, in config.rb
`require 'respond-to'`

#### Import the breakpoint partial at the top of your working file
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
  @include respond-to('monochrome screen') {
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
@media screen and (min-width: 700px) and (max-width: 800px) {
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
    content: 'Monochrome Portrait, Wide in Print";
  }
}
```

## Comparison with Breakpoint Extension

Both `respond-to` and `breakpoint` do very similar things, in fact, `respond-to` is built on the power of `breakpoint`, but there are a few key differences between the two that are worth pointing out.

* Breakpoint relies on variables for naming whereas respond-to releases on full strings. This means that respond-to's queries can have more descriptive names that breakpoint's.
* Respond-to relies on a single variable to hold all queries whereas breakpoint has a separate variable per query. This means that breakpoint's queries are easier to sightread and version when using the Sass syntax.
* Both breakpoint and respond-to use the same media query rendering backend, so the core syntax for each query is identical between both of them.

## License

Copyright (c) 2012 [Sam Richard](https://github.com/Snugug)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 