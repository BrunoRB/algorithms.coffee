algorithms.coffee
=================

[![Build Status](https://travis-ci.org/BrunoRB/algorithms.coffee.png?branch=master)](https://travis-ci.org/BrunoRB/algorithms.coffee)

## Because there is no life without coffee
> Classic algorithms and data structures in CoffeeScript.

> Can be used in either NodeJS (server-side JS) or in the Browser (client-side JS).

> It uses [Mocha](http://visionmedia.github.io/mocha/) as the Testing Framework, [Chai](http://chaijs.com/) as the Assertion Library and [CoffeeLint](http://www.coffeelint.org/) as the Style Checker Library.

## Algorithms implemented so far: ##
Data Structures:
* Adjacency List
* Binary Search Tree
* Disjoint Set
* Heap
* Segment Tree

Graph:
* Shortest Path
	* Bellman-Ford

* Traverse
	* Breadth First Search
	* Depth First Search

* Minimum Spanning Tree
	* Kruskal

* NetworkFlow
	* Edmonds-Karp

* Strongly Connected Components
	* Kosaraju

Math:
* Karatusba Multiplication

Sorting:
* Binary Tree Sort
* Heap Sort
* Insertion Sort
* Merge Sort
* Radix Sort

String:
* Edit Distance
* Knuth-Morris-Pratt
* Longest Common Subsequence

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
To use the library in standard client-side JavaScript just download the js file contained in the ./dist/ then include it like any other .js.
```html
<script src="algorithms.coffee.js"></script>
```

Or the minified version
```html
<script src="algorithms.coffee.min.js"></script>
```

All the library features are available through the global variable algCoffee.

```javascript
var array = [10, 80, 300, 500, 11, 2, 333];
algCoffee.mergeSort(array);

var anotherArray = [30, 20, 1, 3, 99, 667];
var heap = new algCoffee.Heap(anotherArray);
heap.buildMaxHeap();
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
the other default options of [CoffeeLint](http://www.coffeelint.org/).

Before you send a Pull Request, run `grunt` again to be sure that everything is OK.
