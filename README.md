algorithms.coffee
=================

[![Build Status](https://travis-ci.org/BrunoRB/algorithms.coffee.png?branch=master)](https://travis-ci.org/BrunoRB/algorithms.coffee)

## Because there is no life without coffee
> Classic algorithms and data structures in CoffeeScript.
> Can be used in either NodeJS (server-side JS) or in the Browser (client-side JS).
> It uses [Mocha](http://visionmedia.github.io/mocha/) as the Testing Framework, [Chai](http://chaijs.com/) as the Assertion Library and [CoffeeLint](http://www.coffeelint.org/) as the Style Checker Library.

## Getting Started
### Users
#### NodeJS
To use the library on a NodeJS project just install it with `npm`:

Globally:
```shell
npm -g install algorithms.coffee
```

or Locally in the project's directory:
```shell
npm install algorithms.coffee
```

And use the require to use the functions.

Example:
```javascript
var myVariable = require('algorithms.coffee');
var sortedArray = myVariable.insertionSort([3, 1, 2]);
```

#### Browser
To use the library in standard client-side JavaScript just download the following file and use it as any other .js file.
```shell
./dist/algorithms.coffee.js
```

Or the minified version
```shell
./dist/algorithms.coffee.min.js
```

### Contributors

We encourage everybody to contribute with this library. Just try and implement any classic algorithm in CoffeeScript or
improve the ones that are already implemented.

#### Basic Requirements

You will need to have the following softwares installed on your computer:
* [NodeJS](http://nodejs.org/): version 0.10.0 or higher;
* [npm](https://www.npmjs.org/): latest version;
* [git](http://git-scm.com/): latest version;

#### Basic Steps to Contribute

On the terminal of your computer clone this repository in the directory where you want it to be:
````shell
git clone https://github.com/BrunoRB/algorithms.coffee.git
````

Install the necessary packages from which the library depends on:
````shell
npm install
````

and execute Grunt just to make sure everything is up and running:
````shell
grunt
````

From this point on you're good to go and contribute with the library.
Just write your `.coffee` code in the appropriate directory in `./src` and make sure to write the test code as well.
Also, make sure to follow the Coding Style stated in `coffeelint.json` and
the other default options of CoffeeLint.

Before you send a Pull Request, run `grunt` again to be sure that everything is OK.
