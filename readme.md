# @peculiarjs/cssfull

![version] ![MIT][license] ![last-commit]

[version]: https://img.shields.io/npm/v/@peculiarjs/cssfull
[license]: https://img.shields.io/badge/license-MIT-blue.svg
[last-commit]: https://img.shields.io/github/last-commit/peculiarjs/cssfull


Minimalistic `css` library of **utilitarian** classes,
focused on **positioning**, **sizing** and extra goodies around it. Easy to set up and start prototyping blazingly fast ⚡

## <a name="table-of-contents"></a> Table of Contents

* [What `cssfull` is](#what-is)
* [Installation](#installation)
* [Classes naming approach](#naming)
* [Utils overview](#overview)


## 1. <a name="what-is"></a>What `cssfull` is:
* **`just css`** — simple bits of good old `css`
* **`modular`** — use specific `module` or the whole `bundle`
* **`minimalistic`** — up to 10 sm/md size `css` files
* **`easy to setup`** — because it's plain `css`, it is easy to add to any project without hustle
* **`focused`** — main goal is to provide helpers around `positioning` and `sizing` and not being a _swiss knife_ for everything
* **`lib, not a framework`** — created to be used as addition to your current `styling` approach, not a replacement

## 2. <a name="installation"></a>Installation

As `npm` package:
```bash
# npm
npm install @peculiarjs/cssfull

# pnpm
pnpm add @peculiarjs/cssfull
```
After that you can import `index.css` or any specific file from the lib into
your `app.js` and your `bundler` should do the rest:
```jsx
// app.js
import { render } from 'preact'
import '@peculiarjs/cssfull/lib/index.css'

const App = () => (
  <div className="m-40 debug">
    The Spot!
  </div>
)

render(<App />, document.getElementById('app'))
```

Another way is to avoid `npm` package and simply
inject it as `stylesheet` directly into `html`:
```html
<!DOCTYPE html>
<html lang="en">
  <link rel="stylesheet" href="https://unpkg.com/@peculiarjs/cssfull@0.0.2/lib/border.css">
  <link rel="stylesheet" href="https://unpkg.com/@peculiarjs/cssfull@0.0.2/lib/cursor.css">
  <!-- or whole bundle.css can be linked — concatenated and minified version of the whole library -->
  <!-- <link rel="stylesheet" href="https://unpkg.com/@peculiarjs/cssfull@0.0.2/lib/bundle.css">  -->
  <body>
    <div class="debug pointer">
      Content 
    </div>
  </body>
</html>
```


## 3. <a name="naming"></a>Classes naming approach

### Measurement units
Majority of classes in this lib approach 2 main `measurement units`:
* `%`
* `px`

For simplicity `%` is made the default and used everywhere except `margin`,
so class `w-100` should be read like `width: 100%` and `top-50` like `top: 50%`.
On the opposite, absolute values like `px` are used **only** for `margin` or `padding`, so
in that case `mr-20` means `margin-right: 20px` and `m-10` means `margin: 10px`.


### Shortenings

It is **expected** that some utilities will be used **much more often**: 
`width`, `height`, `margin`, `padding`, so for a better and easier readability 
in `HTML/JSX`, these utils names are shortened and used as mnemonics:
```css
/* "w" stands for width */
.w-100 {
  width: 100%;
}

/* "h" stands for height */
.h-100 {
  height: 100%;
}

/* "mt" stands for margin-top */
.mt-20 {
  margin-top: 20px;
}

/* "pr" stands for padding-right */
.pr-20 {
  padding-right: 20px;
}
```


## 4. <a name="overview"></a>Utils overview

Brief overview of the classes.

### flex.css

Everything around **flexbox** properties with simple naming.

```css
.flex {
  display: flex
}
.column {
  flex-direction: column;
}
.row {
  flex-direction: row;
}
...
```

### position.css

Main `positioning` helpers are created around: `relative`, `absolute`, `fixed`, `static` and `sticky` options. 
Also there are helpers for every side `top`, `right`, `bottom`, `left` with 3 values `[0, 50%, 100%]` each.

```css 
.relative {
  position: relative;
}
.absolute {
  position: absolute;
}
...

.top-0 {
  top: 0;
}
.top-50 {
  top: 50%;
}
.top-100 {
  top: 100%;
}
```

### width.css

Set of classes for approaching elements **width** in `%`.

```css
/* from 100 to 0 with a step of 5 */
.w-100 {
  width: 100%;
}
.w-95 {
  width: 95%;
}
...

.w-auto {
  width: auto;
}
```

### height.css

Same but for **height**.

```css
/* from 100 to 0 with a step of 5 */
.h-100 {
  height: 100%;
}
.h-95 {
  height: 95%;
}
...

.h-auto {
  height: auto;
}
```

### display.css

A `block/inline-block` pair.

```css
.block {
  display: block;
}
.inline-block {
  display: inline-block;
}
.hidden {
  display: none;
}
```


### margin.css

Pretty Similiar approach to `width` and `height` classes is used for `margins`.
There are mnemonic for every margin side:
* `m` — `margin`
* `mt` — `margin-top`
* `mr` — `margin-right`
* `mb` — `margin-bottom`
* `ml` — `margin-left`

So for every side classes go with a step of `1px` from `0` to `20px` and then 
with a step of `5px` from `20px` to `50px`.

```css
/* top */ 
.mt-0 {
  margin-top: 0;
}
.mt-1 {
  margin-top: 1px;
}
.mt-2 {
  margin-top: 2px;
}
...

.mt-20 {
  margin-top: 20px;
}
.mt-25 {
  margin-top: 25px;
}
...

.mt-50 {
  margin-top: 50px;
}
```

### padding.css

For `padding` is used the the same approach as for `margin`.
Mnemonics:
* `p` — `padding`
* `pt` — `padding-top`
* `pr` — `padding-right`
* `pb` — `padding-bottom`
* `pl` — `padding-left`

So for every side classes go with a step of `1px` from `0` to `20px` and then 
with a step of `5px` from `20px` to `50px`.

```css
/* right */ 
.pr-0 {
  padding-right: 0;
}
.pr-1 {
  padding-right: 1px;
}
.pr-2 {
  padding-right: 2px;
}
...

.pr-20 {
  padding-right: 20px;
}
.pr-25 {
  padding-right: 25px;
}
...

.pr-50 {
  padding-right: 50px;
}
```

### border.css

`.debug` class for highlighting the needed part and some helpers around `no-border`:

```css
.debug {
  border: 2px dashed red;
}
.no-border {
  border: none;
}
.no-border-top {
  border-top: none;
}
.no-border-right {
  border-right: none;
}
.no-border-bottom {
  border-bottom: none;
}
.no-border-left {
  border-left: none;
}
```
