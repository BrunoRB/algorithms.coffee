/**    The MIT License (MIT)
    Copyright (c) 2014 Bruno Roberto Búrigo and Tayllan Búrigo
    https://github.com/BrunoRB/algorithms.coffee

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
**/
(function() {
  var AdjacencyList;

  AdjacencyList = (function() {
    function AdjacencyList(directed) {
      this.directed = directed != null ? directed : true;
      this.vertices = [];
      this.edges = {};
      this.amountOfVertices = 0;
      this.amountOfEdges = 0;
    }

    AdjacencyList.prototype.addVertex = function(vertex) {
      this.vertices.push(vertex);
      this.edges[vertex] = {};
      return this.amountOfVertices += 1;
    };

    AdjacencyList.prototype.addEdge = function(source, target, weight) {
      if (weight == null) {
        weight = 1;
      }
      if (this.edges[source] === void 0) {
        this.addVertex(source);
      }
      if (this.edges[target] === void 0) {
        this.addVertex(target);
      }
      this.edges[source][target] = weight;
      this.amountOfEdges += 1;
      if (!this.directed) {
        this.edges[target][source] = weight;
        return this.amountOfEdges += 1;
      }
    };

    AdjacencyList.prototype.deleteEdge = function(source, target) {
      if (this.edges[source] !== void 0) {
        delete this.edges[source][target];
        this.amountOfEdges -= 1;
        if (!this.directed && this.edges[target] !== void 0) {
          delete this.edges[target][source];
          return this.amountOfEdges -= 1;
        }
      }
    };

    AdjacencyList.prototype.getEdgeWeight = function(source, target) {
      return this.edges[source][target];
    };

    AdjacencyList.prototype.getRoommates = function(vertex) {
      return this.edges[vertex];
    };

    AdjacencyList.prototype.toString = function() {
      return 'AdjacencyList with ' + this.amountOfVertices + ' vertices and ' + this.amountOfEdges + ' edges.';
    };

    return AdjacencyList;

  })();

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.AdjacencyList = AdjacencyList;

}).call(this);
;(function() {
  var AdjacencyMatrix;

  AdjacencyMatrix = (function() {
    function AdjacencyMatrix(directed) {
      this.directed = directed != null ? directed : true;
      this.adjacencyMatrix = [];
      this.mapping = {};
      this.amountOfVertices = 0;
      this.amountOfEdges = 0;
    }

    AdjacencyMatrix.prototype.addVertex = function(vertex) {
      var i, _i, _ref;
      this.mapping[vertex] = this.amountOfVertices;
      this.adjacencyMatrix.push([]);
      for (i = _i = 0, _ref = this.amountOfVertices; _i <= _ref; i = _i += 1) {
        this.adjacencyMatrix[this.amountOfVertices][i] = void 0;
        this.adjacencyMatrix[i][this.amountOfVertices] = void 0;
      }
      return this.amountOfVertices += 1;
    };

    AdjacencyMatrix.prototype.addEdge = function(source, target, weight) {
      var sourceIndex, targetIndex;
      if (weight == null) {
        weight = 1;
      }
      if (this.mapping[source] === void 0) {
        this.addVertex(source);
      }
      if (this.mapping[target] === void 0) {
        this.addVertex(target);
      }
      sourceIndex = this.mapping[source];
      targetIndex = this.mapping[target];
      this.adjacencyMatrix[sourceIndex][targetIndex] = weight;
      this.amountOfEdges += 1;
      if (!this.directed) {
        this.adjacencyMatrix[targetIndex][sourceIndex] = weight;
        return this.amountOfEdges += 1;
      }
    };

    AdjacencyMatrix.prototype.deleteEdge = function(source, target) {
      var sourceIndex, targetIndex;
      if (this.mapping[source] !== void 0 && this.mapping[target] !== void 0) {
        sourceIndex = this.mapping[source];
        targetIndex = this.mapping[target];
        this.adjacencyMatrix[sourceIndex][targetIndex] = void 0;
        this.amountOfEdges -= 1;
        if (!this.directed) {
          this.adjacencyMatrix[targetIndex][sourceIndex] = void 0;
          return this.amountOfEdges -= 1;
        }
      }
    };

    AdjacencyMatrix.prototype.getEdgeWeight = function(source, target) {
      var sourceIndex, targetIndex;
      if (this.mapping[source] !== void 0 && this.mapping[target] !== void 0) {
        sourceIndex = this.mapping[source];
        targetIndex = this.mapping[target];
        return this.adjacencyMatrix[sourceIndex][targetIndex];
      }
    };

    AdjacencyMatrix.prototype.getRoommates = function(vertex) {
      var vertexIndex;
      if (this.mapping[vertex] !== void 0) {
        vertexIndex = this.mapping[vertex];
        return this.adjacencyMatrix[vertexIndex];
      }
    };

    AdjacencyMatrix.prototype.toString = function() {
      return 'Adjacency Matrix with ' + this.amountOfVertices + ' vertices and ' + this.amountOfEdges + ' edges.';
    };

    return AdjacencyMatrix;

  })();

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.AdjacencyMatrix = AdjacencyMatrix;

}).call(this);
;(function() {
  var BinarySearchTree;

  BinarySearchTree = (function() {
    function BinarySearchTree(value, parent) {
      if (parent == null) {
        parent = null;
      }
      this.value = value;
      this.parent = parent;
      this.left = null;
      this.right = null;
    }

    BinarySearchTree.prototype.insert = function(value) {
      if (value < this.value) {
        if (this.left === null) {
          this.left = new BinarySearchTree(value, this);
          return this.left;
        } else {
          return this.left.insert(value);
        }
      } else {
        if (this.right === null) {
          this.right = new BinarySearchTree(value, this.root);
          return this.right;
        } else {
          return this.right.insert(value);
        }
      }
    };

    BinarySearchTree.prototype["delete"] = function() {
      var minimum;
      if (this.left === null && this.right === null) {
        if (this.isLeftNodeOfParent()) {
          this.parent.left = null;
        } else if (this.isRightNodeOfParent()) {
          this.parent.right = null;
        }
        return this.value = this.left = this.right = this.parent = null;
      } else if (this.left === null) {
        if (this.isLeftNodeOfParent()) {
          this.parent.left = this.right;
        } else if (this.isRightNodeOfParent()) {
          this.parent.right = this.right;
        }
        this.right.parent = this.parent;
        return this.value = this.left = this.right = this.parent = null;
      } else if (this.right === null) {
        if (this.isLeftNodeOfParent()) {
          this.parent.left = this.left;
        } else if (this.isRightNodeOfParent()) {
          this.parent.right = this.left;
        }
        this.left.parent = this.parent;
        return this.value = this.left = this.right = this.parent = null;
      } else {
        minimum = this.findMinimum;
        this.value = minium.value;
        return minimum["delete"]();
      }
    };

    BinarySearchTree.prototype.findMinimum = function() {
      if (this.left === null) {
        return this;
      } else {
        return this.left.findMinimum();
      }
    };

    BinarySearchTree.prototype.findMaximum = function() {
      if (this.right === null) {
        return this;
      } else {
        return this.right.findMaximum();
      }
    };

    BinarySearchTree.prototype.findByValue = function(value) {
      if (value === this.value) {
        return this;
      } else if (value < this.value) {
        if (this.left !== null) {
          return this.left.findByValue(value);
        } else {
          return null;
        }
      } else {
        if (this.right !== null) {
          return this.right.findByValue(value);
        } else {
          return null;
        }
      }
    };

    BinarySearchTree.prototype.isLeftNodeOfParent = function() {
      return this.parent !== null && this.parent.left !== null && this.parent.left.value === this.value;
    };

    BinarySearchTree.prototype.isRightNodeOfParent = function() {
      return this.parent !== null && this.parent.right !== null && this.parent.right.value === this.value;
    };

    return BinarySearchTree;

  })();

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.BinarySearchTree = BinarySearchTree;

}).call(this);
;(function() {
  var DisjointSet;

  DisjointSet = (function() {
    function DisjointSet(arrayOfKeys) {
      var key, _i, _len;
      if (arrayOfKeys == null) {
        arrayOfKeys = [];
      }
      this.parents = {};
      this.ranks = {};
      for (_i = 0, _len = arrayOfKeys.length; _i < _len; _i++) {
        key = arrayOfKeys[_i];
        this.parents[key] = key;
        this.ranks[key] = 0;
      }
    }

    DisjointSet.prototype.find = function(key) {
      if (this.parents[key] !== key) {
        this.parents[key] = this.find(this.parents[key]);
      }
      return this.parents[key];
    };

    DisjointSet.prototype.union = function(x, y) {
      var xRoot, yRoot;
      xRoot = this.find(x);
      yRoot = this.find(y);
      if (xRoot !== yRoot) {
        if (this.ranks[xRoot] < this.ranks[yRoot]) {
          return this.parents[xRoot] = yRoot;
        } else if (this.ranks[xRoot] > this.ranks[yRoot]) {
          return this.parents[yRoot] = xRoot;
        } else {
          this.parents[yRoot] = xRoot;
          return this.ranks[xRoot] += 1;
        }
      }
    };

    return DisjointSet;

  })();

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.DisjointSet = DisjointSet;

}).call(this);
;(function() {
  var Heap;

  Heap = (function() {
    function Heap(array) {
      if (array == null) {
        array = [];
      }
      this.array = array;
    }

    Heap.prototype.buildMaxHeap = function() {
      var arrayLength, i, start, _i, _results;
      arrayLength = this.array.length;
      start = Math.floor(arrayLength / 2);
      _results = [];
      for (i = _i = start; _i >= 0; i = _i += -1) {
        _results.push(this.maxHeapfy(i, arrayLength));
      }
      return _results;
    };

    Heap.prototype.buildMinHeap = function() {
      var arrayLength, i, start, _i, _results;
      arrayLength = this.array.length;
      start = Math.floor(arrayLength / 2);
      _results = [];
      for (i = _i = start; _i >= 0; i = _i += -1) {
        _results.push(this.minHeapfy(i, arrayLength));
      }
      return _results;
    };

    Heap.prototype.maxHeapfy = function(pos, arrayLength) {
      var isGreaterThan;
      isGreaterThan = function(first, second) {
        return first > second;
      };
      return this.heapfy(pos, arrayLength, isGreaterThan, true);
    };

    Heap.prototype.minHeapfy = function(pos, arrayLength) {
      var isLessThan;
      isLessThan = function(first, second) {
        return first < second;
      };
      return this.heapfy(pos, arrayLength, isLessThan, false);
    };

    Heap.prototype.insertIntoMaxHeap = function(value) {
      var isLessThan;
      isLessThan = function(first, second) {
        return first < second;
      };
      return this.bubbleUp(this.array.length - 1, isLessThan);
    };

    Heap.prototype.insertIntoMinHeap = function(value) {
      var isGreaterThan;
      isGreaterThan = function(first, second) {
        return first > second;
      };
      return this.bubbleUp(this.array.length - 1, isGreaterThan);
    };

    Heap.prototype.extractMax = function() {
      var lastPos, maxValue, _ref;
      lastPos = this.array.length - 1;
      _ref = [this.array[lastPos], this.array[0]], this.array[0] = _ref[0], this.array[lastPos] = _ref[1];
      maxValue = this.array.pop();
      this.maxHeapfy(0, this.array.length);
      return maxValue;
    };

    Heap.prototype.extractMin = function() {
      var lastPos, minValue, _ref;
      lastPos = this.array.length - 1;
      _ref = [this.array[lastPos], this.array[0]], this.array[0] = _ref[0], this.array[lastPos] = _ref[1];
      minValue = this.array.pop();
      this.minHeapfy(0, this.array.length);
      return minValue;
    };

    Heap.prototype.heapfy = function(pos, arrayLength, compareFn, isMaxHeapfy) {
      var largestPos, leftPos, rightPos, _ref;
      leftPos = 2 * pos + 1;
      rightPos = 2 * (pos + 1);
      largestPos = pos;
      if (leftPos < arrayLength && compareFn(this.array[leftPos], this.array[largestPos])) {
        largestPos = leftPos;
      }
      if (rightPos < arrayLength && compareFn(this.array[rightPos], this.array[largestPos])) {
        largestPos = rightPos;
      }
      if (largestPos !== pos) {
        _ref = [this.array[largestPos], this.array[pos]], this.array[pos] = _ref[0], this.array[largestPos] = _ref[1];
        if (isMaxHeapfy) {
          return this.maxHeapfy(largestPos, arrayLength);
        } else {
          return this.minHeapfy(largestPos, arrayLength);
        }
      }
    };

    Heap.prototype.bubbleUp = function(pos, compareFn) {
      var parentPos, _ref;
      parentPos = Math.floor((pos - 1) / 2);
      if (parentPos >= 0 && compareFn(this.array[parentPos], this.array[pos])) {
        _ref = [this.array[parentPos], this.array[pos]], this.array[pos] = _ref[0], this.array[parentPos] = _ref[1];
        return this.bubbleUp(parentPos, compareFn);
      }
    };

    return Heap;

  })();

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.Heap = Heap;

}).call(this);
;(function() {
  var SegmentTree;

  SegmentTree = (function() {
    function SegmentTree(arrayOfElements, leftLimit, rightLimit, operation) {
      var halfLimit;
      if (arrayOfElements == null) {
        arrayOfElements = [];
      }
      this.operation = operation;
      this.leftIndex = leftLimit;
      this.rightIndex = rightLimit;
      if (leftLimit === rightLimit) {
        this.leftNode = null;
        this.rightNode = null;
        this.total = arrayOfElements[leftLimit];
      } else {
        halfLimit = parseInt((leftLimit + rightLimit) / 2);
        this.leftNode = new SegmentTree(arrayOfElements, leftLimit, halfLimit, this.operation);
        this.rightNode = new SegmentTree(arrayOfElements, halfLimit + 1, rightLimit, this.operation);
        this.total = this.operation(this.leftNode.total, this.rightNode.total);
      }
    }

    SegmentTree.prototype.query = function(i, j) {
      var leftTotal, rightTotal;
      if (j < this.leftIndex || this.rightIndex < i) {
        return void 0;
      } else if (i <= this.leftIndex && this.rightIndex <= j) {
        return this.total;
      } else {
        leftTotal = this.leftNode.query(i, j);
        rightTotal = this.rightNode.query(i, j);
        if (leftTotal === void 0 && rightTotal === void 0) {
          return void 0;
        } else if (leftTotal === void 0) {
          return rightTotal;
        } else if (rightTotal === void 0) {
          return leftTotal;
        } else {
          return this.operation(leftTotal, rightTotal);
        }
      }
    };

    SegmentTree.prototype.update = function(index, newValue) {
      if (index < this.leftIndex || this.rightIndex < index) {
        return this.total;
      } else if (index <= this.leftIndex && this.rightIndex <= index) {
        this.total = newValue;
        return this.total;
      } else {
        this.total = this.operation(this.leftNode.update(index, newValue), this.rightNode.update(index, newValue));
        return this.total;
      }
    };

    return SegmentTree;

  })();

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.SegmentTree = SegmentTree;

}).call(this);
;(function() {
  var bellmanFord;

  bellmanFord = function(graph, startVertex) {
    var i, minimumDistances, source, sourceDistance, target, targetDistance, value, vertex, weight, _i, _j, _len, _ref, _ref1, _ref2, _ref3;
    minimumDistances = {};
    _ref = graph.vertices;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      vertex = _ref[_i];
      minimumDistances[vertex] = Infinity;
    }
    minimumDistances[startVertex] = 0.0;
    for (i = _j = 0, _ref1 = graph.amountOfVertices - 1; _j < _ref1; i = _j += 1) {
      _ref2 = graph.edges;
      for (source in _ref2) {
        value = _ref2[source];
        for (target in value) {
          weight = value[target];
          sourceDistance = minimumDistances[source] + weight;
          targetDistance = minimumDistances[target];
          if (sourceDistance < targetDistance) {
            minimumDistances[target] = sourceDistance;
          }
        }
      }
    }
    _ref3 = graph.edges;
    for (source in _ref3) {
      value = _ref3[source];
      for (target in value) {
        weight = value[target];
        sourceDistance = minimumDistances[source] + weight;
        targetDistance = minimumDistances[target];
        if (sourceDistance < targetDistance) {
          return {
            distance: {}
          };
        }
      }
    }
    return {
      distance: minimumDistances
    };
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.bellmanFord = bellmanFord;

}).call(this);
;(function() {
  var breadthFirstSearch,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  breadthFirstSearch = function(graph, fn) {
    var queue, u, v, vertex, visited, _i, _j, _len, _len1, _ref, _ref1;
    visited = {};
    queue = [];
    _ref = graph.vertices;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      vertex = _ref[_i];
      queue.push(vertex);
      while (queue.length > 0) {
        v = queue.shift();
        if (__indexOf.call(visited, v) >= 0 === false) {
          if (fn != null) {
            fn.call(graph, v);
          }
          visited[v] = true;
          _ref1 = graph.getRoommates(v);
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            u = _ref1[_j];
            queue.push(u);
          }
        }
      }
    }
    return true;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.breadthFirstSearch = breadthFirstSearch;

}).call(this);
;(function() {
  var AdjacencyList, cycleDetection;

  AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList;

  cycleDetection = function(graph) {
    var currentVertex, list, roommates, target, visited, weight;
    list = [];
    visited = {};
    list.push(graph.vertices[0]);
    while (list.length > 0) {
      currentVertex = list.shift();
      visited[currentVertex] = true;
      roommates = graph.getRoommates(currentVertex);
      for (target in roommates) {
        weight = roommates[target];
        if (visited[target]) {
          return true;
        } else {
          list.push(target);
        }
      }
    }
    return false;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.cycleDetection = cycleDetection;

}).call(this);
;(function() {
  var depthFirstSearch;

  depthFirstSearch = function(graph) {
    var dfs, finishingTimes, time, vertex, visitedVertices, _i, _len, _ref;
    time = 0;
    visitedVertices = {};
    finishingTimes = {};
    dfs = function(vertex) {
      var roommate, weight, _ref;
      visitedVertices[vertex] = true;
      _ref = graph.getRoommates(vertex);
      for (roommate in _ref) {
        weight = _ref[roommate];
        if (visitedVertices[roommate] === void 0) {
          dfs(roommate);
        }
      }
      finishingTimes[vertex] = time;
      return time += 1;
    };
    _ref = graph.vertices;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      vertex = _ref[_i];
      if (visitedVertices[vertex] === void 0) {
        dfs(vertex);
      }
    }
    return finishingTimes;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.depthFirstSearch = depthFirstSearch;

}).call(this);
;(function() {
  var AdjacencyList, edmondsKarp;

  if (typeof module !== 'undefined') {
    AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList;
  } else {
    AdjacencyList = algCoffee.AdjacencyList;
  }

  edmondsKarp = function(graph, sourceVertex, sinkVertex) {
    var aux, createResidualGraph, eliminateAntiParallelEdges, findAugmentingPath, maximumFlow, residualGraph;
    sourceVertex += '';
    sinkVertex += '';
    createResidualGraph = function() {
      var residualGraph, source, target, value, weight, _ref;
      residualGraph = new AdjacencyList();
      _ref = graph.edges;
      for (source in _ref) {
        value = _ref[source];
        for (target in value) {
          weight = value[target];
          if (graph.getEdgeWeight(target, source) === void 0) {
            residualGraph.addEdge(target, source, 0);
          }
          residualGraph.addEdge(source, target, weight);
        }
      }
      return residualGraph;
    };
    eliminateAntiParallelEdges = function() {
      var newVertex, source, target, value, weight, _ref, _results;
      _ref = residualGraph.edges;
      _results = [];
      for (source in _ref) {
        value = _ref[source];
        _results.push((function() {
          var _results1;
          _results1 = [];
          for (target in value) {
            weight = value[target];
            if (residualGraph.edges[target][source] !== void 0) {
              newVertex = parseInt(Math.random() * residualGraph.amountOfVertices * 10);
              while (residualGraph.edges[newVertex] !== void 0) {
                newVertex = parseInt(Math.random() * residualGraph.amountOfVertices * 10);
              }
              residualGraph.addEdge(source, newVertex, weight);
              residualGraph.addEdge(newVertex, target, weight);
              _results1.push(residualGraph.deleteEdge(source, target));
            } else {
              _results1.push(void 0);
            }
          }
          return _results1;
        })());
      }
      return _results;
    };
    findAugmentingPath = function(sourceVertex, sinkVertex) {
      var currentVertex, currentVertexRoommates, maximumFlowThroughPath, parent, parents, queue, target, v, visitedVertices, weight;
      parents = {};
      maximumFlowThroughPath = {};
      visitedVertices = {};
      queue = [];
      visitedVertices[sourceVertex] = true;
      queue.push(sourceVertex);
      while (queue.length > 0) {
        currentVertex = queue.shift();
        if (currentVertex === sinkVertex) {
          v = sinkVertex;
          parent = parents[v];
          while (parent !== void 0) {
            residualGraph.edges[parent][v] -= maximumFlowThroughPath[sinkVertex];
            residualGraph.edges[v][parent] += maximumFlowThroughPath[sinkVertex];
            if (residualGraph.edges[parent][v] === 0) {
              residualGraph.deleteEdge(parent, v);
            }
            v = parent;
            parent = parents[parent];
          }
          return maximumFlowThroughPath[sinkVertex];
        }
        currentVertexRoommates = residualGraph.getRoommates(currentVertex);
        for (target in currentVertexRoommates) {
          weight = currentVertexRoommates[target];
          if (visitedVertices[target] === void 0) {
            parents[target] = currentVertex;
            if (maximumFlowThroughPath[currentVertex] === void 0) {
              maximumFlowThroughPath[target] = weight;
            } else {
              maximumFlowThroughPath[target] = Math.min(maximumFlowThroughPath[currentVertex], weight);
            }
            visitedVertices[target] = true;
            queue.push(target);
          }
        }
      }
      return void 0;
    };
    residualGraph = createResidualGraph();
    eliminateAntiParallelEdges();
    maximumFlow = 0;
    aux = 0;
    while ((aux = findAugmentingPath(sourceVertex, sinkVertex)) !== void 0) {
      maximumFlow += aux;
    }
    return maximumFlow;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.edmondsKarp = edmondsKarp;

}).call(this);
;(function() {
  var AdjacencyList, fordFulkerson;

  if (typeof module !== 'undefined') {
    AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList;
  } else {
    AdjacencyList = algCoffee.AdjacencyList;
  }

  fordFulkerson = function(graph, sourceVertex, sinkVertex) {
    var aux, createResidualGraph, eliminateAntiParallelEdges, findAugmentingPath, maximumFlow, residualGraph;
    sourceVertex += '';
    sinkVertex += '';
    createResidualGraph = function() {
      var residualGraph, source, target, value, weight, _ref;
      residualGraph = new AdjacencyList();
      _ref = graph.edges;
      for (source in _ref) {
        value = _ref[source];
        for (target in value) {
          weight = value[target];
          if (graph.getEdgeWeight(target, source) === void 0) {
            residualGraph.addEdge(target, source, 0);
          }
          residualGraph.addEdge(source, target, weight);
        }
      }
      return residualGraph;
    };
    eliminateAntiParallelEdges = function() {
      var newVertex, source, target, value, weight, _ref, _results;
      _ref = residualGraph.edges;
      _results = [];
      for (source in _ref) {
        value = _ref[source];
        _results.push((function() {
          var _results1;
          _results1 = [];
          for (target in value) {
            weight = value[target];
            if (residualGraph.edges[target][source] !== void 0) {
              newVertex = parseInt(Math.random() * residualGraph.amountOfVertices * 10);
              while (residualGraph.edges[newVertex] !== void 0) {
                newVertex = parseInt(Math.random() * residualGraph.amountOfVertices * 10);
              }
              residualGraph.addEdge(source, newVertex, weight);
              residualGraph.addEdge(newVertex, target, weight);
              _results1.push(residualGraph.deleteEdge(source, target));
            } else {
              _results1.push(void 0);
            }
          }
          return _results1;
        })());
      }
      return _results;
    };
    findAugmentingPath = function(sourceVertex, sinkVertex) {
      var currentVertex, currentVertexRoommates, maximumFlowThroughPath, parent, parents, queue, target, v, visitedVertices, weight;
      parents = {};
      maximumFlowThroughPath = {};
      visitedVertices = {};
      queue = [];
      visitedVertices[sourceVertex] = true;
      queue.push(sourceVertex);
      while (queue.length > 0) {
        currentVertex = queue.shift();
        if (currentVertex === sinkVertex) {
          v = sinkVertex;
          parent = parents[v];
          while (parent !== void 0) {
            residualGraph.edges[parent][v] -= maximumFlowThroughPath[sinkVertex];
            residualGraph.edges[v][parent] += maximumFlowThroughPath[sinkVertex];
            if (residualGraph.edges[parent][v] === 0) {
              residualGraph.deleteEdge(parent, v);
            }
            v = parent;
            parent = parents[parent];
          }
          return maximumFlowThroughPath[sinkVertex];
        }
        currentVertexRoommates = residualGraph.getRoommates(currentVertex);
        for (target in currentVertexRoommates) {
          weight = currentVertexRoommates[target];
          if (visitedVertices[target] === void 0) {
            parents[target] = currentVertex;
            if (maximumFlowThroughPath[currentVertex] === void 0) {
              maximumFlowThroughPath[target] = weight;
            } else {
              maximumFlowThroughPath[target] = Math.min(maximumFlowThroughPath[currentVertex], weight);
            }
            visitedVertices[target] = true;
            queue.push(target);
          }
        }
      }
      return void 0;
    };
    residualGraph = createResidualGraph();
    eliminateAntiParallelEdges();
    maximumFlow = 0;
    aux = 0;
    while ((aux = findAugmentingPath(sourceVertex, sinkVertex)) !== void 0) {
      maximumFlow += aux;
    }
    return maximumFlow;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.fordFulkerson = fordFulkerson;

}).call(this);
;(function() {
  var AdjacencyList, depthFirstSearch, kosaraju;

  if (typeof module !== 'undefined') {
    depthFirstSearch = require('./depth-first-search').algCoffee.depthFirstSearch;
    AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList;
  } else {
    depthFirstSearch = algCoffee.depthFirstSearch;
    AdjacencyList = algCoffee.AdjacencyList;
  }

  kosaraju = function(graph) {
    var connectedComponents, finishingTime, finishingTimes, mappingComponents, revertGraph, sortedFinishingTimes, vertex, vertexArray, visitedVertices, _i, _len;
    revertGraph = function() {
      var reverseGraph, source, target, value, vertex, weight, _i, _len, _ref, _ref1;
      reverseGraph = new AdjacencyList(graph.directed);
      _ref = graph.vertices;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        vertex = _ref[_i];
        reverseGraph.addVertex(vertex);
      }
      _ref1 = graph.edges;
      for (source in _ref1) {
        value = _ref1[source];
        for (target in value) {
          weight = value[target];
          reverseGraph.addEdge(target, source, weight);
        }
      }
      return graph = reverseGraph;
    };
    mappingComponents = function(vertex) {
      var currentVertex, localComponent, stack, weight, _ref;
      stack = [];
      localComponent = [];
      stack.push(vertex);
      while (stack.length > 0) {
        currentVertex = stack.pop();
        visitedVertices[currentVertex] = true;
        localComponent.push(currentVertex);
        _ref = graph.getRoommates(currentVertex);
        for (vertex in _ref) {
          weight = _ref[vertex];
          if (visitedVertices[vertex] === void 0) {
            stack.push(vertex);
          }
        }
      }
      return localComponent;
    };
    finishingTimes = depthFirstSearch(graph);
    sortedFinishingTimes = [];
    for (vertex in finishingTimes) {
      finishingTime = finishingTimes[vertex];
      sortedFinishingTimes.push([vertex, finishingTime]);
    }
    sortedFinishingTimes.sort(function(a, b) {
      return b[1] - a[1];
    });
    connectedComponents = [];
    visitedVertices = {};
    revertGraph();
    for (_i = 0, _len = sortedFinishingTimes.length; _i < _len; _i++) {
      vertexArray = sortedFinishingTimes[_i];
      vertex = vertexArray[0];
      if (visitedVertices[vertex] === void 0) {
        connectedComponents.push(mappingComponents(vertex));
      }
    }
    return connectedComponents;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.kosaraju = kosaraju;

}).call(this);
;(function() {
  var DisjointSet, kruskal;

  if (typeof module !== 'undefined') {
    DisjointSet = require('./../data-structures/disjoint-set').algCoffee.DisjointSet;
  } else {
    DisjointSet = algCoffee.DisjointSet;
  }

  kruskal = function(graph) {
    var edge, minimumSpanningTree, set, sortedEdges, source, target, value, weight, _i, _len, _ref;
    minimumSpanningTree = 0.0;
    set = new DisjointSet(graph.vertices);
    sortedEdges = [];
    _ref = graph.edges;
    for (source in _ref) {
      value = _ref[source];
      for (target in value) {
        weight = value[target];
        sortedEdges.push([source, target, weight]);
      }
    }
    sortedEdges.sort(function(a, b) {
      return a[2] - b[2];
    });
    for (_i = 0, _len = sortedEdges.length; _i < _len; _i++) {
      edge = sortedEdges[_i];
      if (set.find(edge[0]) !== set.find(edge[1])) {
        minimumSpanningTree += edge[2];
        set.union(edge[0], edge[1]);
      }
    }
    return minimumSpanningTree;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.kruskal = kruskal;

}).call(this);
;/*
    @param{Object} the first cartesian point, with the X and Y properties
    @param{Object} the second cartesian point, with the X and Y properties
    @return{Number} the Euclidean Distance between the given points
 */

(function() {
  var euclideanDistance;

  euclideanDistance = function(pointA, pointB) {
    var xSquared, ySquared;
    if (pointA !== void 0 && pointB !== void 0) {
      if (pointA.x === void 0 || pointA.y === void 0 || pointB.x === void 0 || pointB.y === void 0) {
        return void 0;
      } else {
        xSquared = (pointB.x - pointA.x) * (pointB.x - pointA.x);
        ySquared = (pointB.y - pointA.y) * (pointB.y - pointA.y);
        return Math.sqrt(xSquared + ySquared);
      }
    } else {
      return void 0;
    }
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.euclideanDistance = euclideanDistance;

}).call(this);
;(function() {
  var karatsubaMultiplication;

  karatsubaMultiplication = function(numberA, numberB) {
    var aOne, aTwo, amountOfDigits, amountOfDigitsInA, amountOfDigitsInB, bOne, bTwo, base, result, z0, z1, z2;
    amountOfDigits = function(number) {
      var counter;
      if (number === 0) {
        return 1;
      }
      counter = 0;
      while (parseInt(number) > 0) {
        number /= 10;
        counter += 1;
      }
      while (parseInt(number) < 0) {
        number /= 10;
        counter += 1;
      }
      return counter;
    };
    amountOfDigitsInA = amountOfDigits(numberA);
    amountOfDigitsInB = amountOfDigits(numberB);
    base = parseInt(Math.pow(10, (amountOfDigitsInA <= amountOfDigitsInB ? amountOfDigitsInA : amountOfDigitsInB)) - 1);
    aOne = Math.floor(numberA / base);
    aTwo = parseInt(numberA % base);
    bOne = Math.floor(numberB / base);
    bTwo = parseInt(numberB % base);
    z0 = parseInt(aTwo * bTwo);
    z2 = parseInt(aOne * bOne);
    z1 = parseInt((aOne + aTwo) * (bOne + bTwo) - z0 - z2);
    result = parseInt((z2 * base * base) + (z1 * base) + z0);
    return result;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.karatsubaMultiplication = karatsubaMultiplication;

}).call(this);
;(function() {
  var knuthShuffle;

  knuthShuffle = function(array) {
    var i, j, length, _i, _ref;
    length = array.length;
    for (i = _i = 0; _i < length; i = _i += 1) {
      j = Math.floor(Math.random() * (i + 1));
      _ref = [array[j], array[i]], array[i] = _ref[0], array[j] = _ref[1];
    }
    return array;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.knuthShuffle = knuthShuffle;

}).call(this);
;(function() {
  var nextPermutation;

  nextPermutation = function(array) {
    var element, i, index, k, l, length, tempArray, _i, _j, _k, _len, _ref, _ref1;
    k = -1;
    length = array.length;
    for (i = _i = 0, _ref = length - 1; _i < _ref; i = _i += 1) {
      if (array[i] < array[i + 1] && i > k) {
        k = i;
      }
    }
    if (k === -1) {
      return array;
    } else {
      l = k + 1;
      for (i = _j = l; _j < length; i = _j += 1) {
        if (array[i] > array[k]) {
          l = i;
        }
      }
      _ref1 = [array[l], array[k]], array[k] = _ref1[0], array[l] = _ref1[1];
      tempArray = array.slice(k + 1, length);
      index = length - 1;
      for (_k = 0, _len = tempArray.length; _k < _len; _k++) {
        element = tempArray[_k];
        array[index] = element;
        index -= 1;
      }
      return array;
    }
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.nextPermutation = nextPermutation;

}).call(this);
;(function() {
  var reservoirSampling;

  reservoirSampling = function(array, lengthOfSample) {
    var i, j, length, reservoir, _i, _j, _ref;
    length = array.length;
    if (lengthOfSample > length) {
      lengthOfSample = length;
    }
    reservoir = array.slice(0, lengthOfSample);
    for (i = _i = 0; _i < lengthOfSample; i = _i += 1) {
      reservoir[i] = array[i];
    }
    for (i = _j = _ref = lengthOfSample + 1; _j < length; i = _j += 1) {
      j = Math.floor(Math.random() * (i + 1));
      if (j < lengthOfSample) {
        reservoir[j] = array[i];
      }
    }
    return reservoir;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.reservoirSampling = reservoirSampling;

}).call(this);
;(function() {
  var Comparator, binarySearch;

  if (typeof module !== 'undefined') {
    Comparator = require('./../util/comparator').algCoffee.Comparator;
  } else {
    Comparator = algCoffee.Comparator;
  }

  binarySearch = function(array, number, compareFn) {
    var comparator, half, inferiorLimit, superiorLimit;
    inferiorLimit = 0;
    superiorLimit = array.length - 1;
    comparator = new Comparator(compareFn);
    while (superiorLimit >= inferiorLimit) {
      half = parseInt((superiorLimit + inferiorLimit) / 2);
      if (comparator.equal(array[half], number)) {
        return half;
      } else if (comparator.greaterThan(array[half], number)) {
        superiorLimit = half - 1;
      } else {
        inferiorLimit = half + 1;
      }
    }
    return -1;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.binarySearch = binarySearch;

}).call(this);
;(function() {
  var BinarySearchTree, bstSort;

  if (typeof module !== 'undefined') {
    BinarySearchTree = require('./../data-structures/binary-search-tree').algCoffee.BinarySearchTree;
  } else {
    BinarySearchTree = algCoffee.BinarySearchTree;
  }

  bstSort = function(array) {
    var bstRoot, i, index, traverseInOrder, _i, _ref;
    bstRoot = new BinarySearchTree(array[0]);
    for (i = _i = 1, _ref = array.length; _i < _ref; i = _i += 1) {
      bstRoot.insert(array[i]);
    }
    index = 0;
    traverseInOrder = function(bst) {
      if (bst.left !== null) {
        traverseInOrder(bst.left);
      }
      array[index] = bst.value;
      index += 1;
      if (bst.right !== null) {
        return traverseInOrder(bst.right);
      }
    };
    traverseInOrder(bstRoot);
    return array;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.bstSort = bstSort;

}).call(this);
;(function() {
  var Heap, heapSort;

  if (typeof module !== 'undefined') {
    Heap = require('./../data-structures/heap').algCoffee.Heap;
  } else {
    Heap = algCoffee.Heap;
  }

  heapSort = function(array) {
    var heap, length, _ref;
    heap = new Heap(array);
    heap.buildMaxHeap();
    length = array.length;
    while (length > 0) {
      length -= 1;
      _ref = [array[length], array[0]], array[0] = _ref[0], array[length] = _ref[1];
      heap.maxHeapfy(0, length);
    }
    return array;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.heapSort = heapSort;

}).call(this);
;(function() {
  var insertionSort;

  insertionSort = function(array) {
    var aux, i, j, _i, _ref;
    for (i = _i = 1, _ref = array.length; _i < _ref; i = _i += 1) {
      aux = array[i];
      j = i;
      while (j > 0 && aux < array[j - 1]) {
        array[j] = array[j - 1];
        j -= 1;
      }
      array[j] = aux;
    }
    return array;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.insertionSort = insertionSort;

}).call(this);
;(function() {
  var mergeSort;

  mergeSort = function(array) {
    var divide, merge;
    divide = function(array) {
      var halfLength, left, leftPart, right, rigthPart;
      if (array.length === 1) {
        return array;
      } else {
        halfLength = Math.floor(array.length / 2);
        leftPart = array.slice(0, halfLength);
        rigthPart = array.slice(halfLength, array.length);
        left = divide(leftPart);
        right = divide(rigthPart);
        return merge(left, right);
      }
    };
    merge = function(leftArray, rightArray) {
      var i, j, leftLength, orderedArray, rigthLength;
      leftLength = leftArray.length;
      rigthLength = rightArray.length;
      orderedArray = [];
      i = 0;
      j = 0;
      while (i < leftLength || j < rigthLength) {
        if (i === leftLength) {
          orderedArray.push(rightArray[j]);
          j += 1;
        } else if (j === rigthLength) {
          orderedArray.push(leftArray[i]);
          i += 1;
        } else if (leftArray[i] <= rightArray[j]) {
          orderedArray.push(leftArray[i]);
          i += 1;
        } else if (rightArray[j] < leftArray[i]) {
          orderedArray.push(rightArray[j]);
          j += 1;
        }
      }
      return orderedArray;
    };
    return divide(array);
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.mergeSort = mergeSort;

}).call(this);
;(function() {
  var radixSort;

  radixSort = function(array) {
    var auxArray, digit, dividedBy, dividedValue, index, l, list, maxNumberOfDigits, maxValue, value, x, _i, _j, _k, _l, _len, _len1, _len2, _len3, _m;
    maxValue = array[0];
    for (_i = 0, _len = array.length; _i < _len; _i++) {
      value = array[_i];
      if (value > maxValue) {
        maxValue = value;
      }
    }
    maxNumberOfDigits = 0;
    while (maxValue !== 0) {
      maxNumberOfDigits += 1;
      maxValue = Math.floor(maxValue / 10);
    }
    dividedBy = 1;
    for (x = _j = 0; 0 <= maxNumberOfDigits ? _j < maxNumberOfDigits : _j > maxNumberOfDigits; x = 0 <= maxNumberOfDigits ? ++_j : --_j) {
      auxArray = (function() {
        var _k, _results;
        _results = [];
        for (l = _k = 0; _k < 10; l = ++_k) {
          _results.push([]);
        }
        return _results;
      })();
      for (_k = 0, _len1 = array.length; _k < _len1; _k++) {
        value = array[_k];
        dividedValue = Math.floor(value / dividedBy);
        digit = dividedValue % 10;
        auxArray[digit].push(value);
      }
      index = 0;
      for (_l = 0, _len2 = auxArray.length; _l < _len2; _l++) {
        list = auxArray[_l];
        for (_m = 0, _len3 = list.length; _m < _len3; _m++) {
          value = list[_m];
          array[index] = value;
          index += 1;
        }
      }
      dividedBy *= 10;
    }
    return array;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.radixSort = radixSort;

}).call(this);
;(function() {
  var editDistance;

  editDistance = function(firstSequence, secondSequence, operationCost) {
    var deletion, dynamicTable, firstSequenceLength, i, insertion, j, secondSequenceLength, substitution, _i, _j, _k, _l, _m, _n;
    if (operationCost == null) {
      operationCost = 1;
    }
    firstSequenceLength = firstSequence.length;
    secondSequenceLength = secondSequence.length;
    dynamicTable = [];
    for (i = _i = 0; _i <= firstSequenceLength; i = _i += 1) {
      dynamicTable.push([]);
      for (j = _j = 0; _j <= secondSequenceLength; j = _j += 1) {
        dynamicTable[i].push(0);
      }
    }
    for (i = _k = 0; _k <= firstSequenceLength; i = _k += 1) {
      dynamicTable[i][0] = i;
    }
    for (i = _l = 0; _l <= secondSequenceLength; i = _l += 1) {
      dynamicTable[0][i] = i;
    }
    for (i = _m = 1; _m <= firstSequenceLength; i = _m += 1) {
      for (j = _n = 1; _n <= secondSequenceLength; j = _n += 1) {
        if (firstSequence[i - 1] === secondSequence[j - 1]) {
          dynamicTable[i][j] = dynamicTable[i - 1][j - 1];
        } else {
          insertion = dynamicTable[i][j - 1] + operationCost;
          deletion = dynamicTable[i - 1][j] + operationCost;
          substitution = dynamicTable[i - 1][j - 1] + operationCost;
          dynamicTable[i][j] = Math.min(insertion, Math.min(deletion, substitution));
        }
      }
    }
    return dynamicTable[firstSequenceLength][secondSequenceLength];
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.editDistance = editDistance;

}).call(this);
;(function() {
  var karpRabin;

  karpRabin = function(string, pattern) {
    var base, equalStr, hash, i, j, patternHash, substringHash, _i, _ref;
    base = 997;
    equalStr = function(strOne, strTwo) {
      var i, _i, _ref;
      for (i = _i = 0, _ref = strOne.length; _i < _ref; i = _i += 1) {
        if (strOne[i] !== strTwo[i]) {
          return false;
        }
      }
      return true;
    };
    hash = function(str, startIndex, endIndex, hash) {
      var i, subStrLength, _i;
      if (hash == null) {
        hash = 0;
      }
      subStrLength = endIndex - startIndex;
      if (hash === 0) {
        for (i = _i = startIndex; _i < endIndex; i = _i += 1) {
          hash += str.charCodeAt(i) * Math.pow(base, subStrLength - i - 1);
        }
      } else {
        hash -= str.charCodeAt(startIndex - 1) * Math.pow(base, subStrLength - 1);
        hash *= base;
        hash += str.charCodeAt(endIndex - 1);
      }
      return hash;
    };
    patternHash = hash(pattern, 0, pattern.length);
    substringHash = 0;
    for (i = _i = 0, _ref = string.length - pattern.length + 1; _i < _ref; i = _i += 1) {
      substringHash = hash(string, i, pattern.length + i, substringHash);
      if (substringHash === patternHash) {
        j = i + pattern.length;
        if (equalStr(pattern, string.slice(i, j))) {
          return true;
        }
      }
    }
    return false;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.karpRabin = karpRabin;

}).call(this);
;/*
    @param {Array} text of Numbers, Strings or Characters
        or {String}
    @param {Array} pattern of Numbers, Strings or Characters
        or {String}
    @return {Number} the position where the pattern begins in the text
        or the length of the text if the pattern doesn't exist in the text
 */

(function() {
  var knuthMorrisPratt;

  knuthMorrisPratt = function(text, pattern) {
    var buildTable, i, m, patternLength, table, textLength;
    buildTable = function() {
      var cnd, i, pos, table, _i;
      pos = 2;
      cnd = 0;
      table = [];
      table.push(-1);
      table.push(0);
      for (i = _i = 2; _i < patternLength; i = _i += 1) {
        table.push(0);
      }
      while (pos < patternLength) {
        if (pattern[pos - 1] === pattern[cnd]) {
          cnd += 1;
          table[pos] = cnd;
          pos += 1;
        } else if (cnd > 0) {
          cnd = table[cnd];
        } else {
          table[pos] = 0;
          pos += 1;
        }
      }
      return table;
    };
    textLength = text.length;
    patternLength = pattern.length;
    m = 0;
    i = 0;
    table = buildTable();
    while (m + i < textLength) {
      if (pattern[i] === text[m + i]) {
        if (i === patternLength - 1) {
          return m;
        }
        i += 1;
      } else {
        if (table[i] >= 0) {
          i = table[i];
          m = m + i - table[i];
        } else {
          i = 0;
          m += 1;
        }
      }
    }
    return textLength;
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.knuthMorrisPratt = knuthMorrisPratt;

}).call(this);
;/*
    @param{Array} the first sequence (of chars or ints)
    @param{Array} the second sequence (of chars or ints)
    @param{Boolean, optional}
    @return{String or Integer}
        if the Boolean parameter is TRUE
            returns the Longest Common Subsequence in a String
            e.g.: 'abc'
        else
            returns the size of the LCS
            e.g.: 3
 */

(function() {
  var longestCommonSubsequence;

  longestCommonSubsequence = function(firstSequence, secondSequence, reconstructSubsequence) {
    var firstLength, lcsSize, reconstructLcs, secondLength;
    if (reconstructSubsequence == null) {
      reconstructSubsequence = false;
    }
    firstLength = firstSequence.length;
    secondLength = secondSequence.length;
    lcsSize = function() {
      var charFirstSequence, i, previousLine, previousValue, _i, _j, _k, _len, _ref;
      previousLine = [];
      for (i = _i = 0; _i <= secondLength; i = _i += 1) {
        previousLine[i] = 0;
      }
      for (_j = 0, _len = firstSequence.length; _j < _len; _j++) {
        charFirstSequence = firstSequence[_j];
        previousValue = 0;
        for (i = _k = 1; _k <= secondLength; i = _k += 1) {
          if (charFirstSequence === secondSequence[i - 1]) {
            _ref = [previousValue + 1, previousLine[i]], previousLine[i] = _ref[0], previousValue = _ref[1];
          } else {
            previousValue = previousLine[i];
            previousLine[i] = Math.max(previousLine[i - 1], previousLine[i]);
          }
        }
      }
      return previousLine[secondLength];
    };
    reconstructLcs = function() {
      var dynamicTable, i, j, subsequence, _i, _j, _k, _l;
      dynamicTable = [];
      for (i = _i = 0; _i <= firstLength; i = _i += 1) {
        dynamicTable.push([]);
        for (j = _j = 0; _j <= secondLength; j = _j += 1) {
          dynamicTable[i].push(0);
        }
      }
      for (i = _k = 1; _k <= firstLength; i = _k += 1) {
        for (j = _l = 1; _l <= secondLength; j = _l += 1) {
          if (firstSequence[i - 1] === secondSequence[j - 1]) {
            dynamicTable[i][j] = dynamicTable[i - 1][j - 1] + 1;
          } else {
            dynamicTable[i][j] = Math.max(dynamicTable[i - 1][j], dynamicTable[i][j - 1]);
          }
        }
      }
      subsequence = [];
      i = firstLength;
      j = secondLength;
      while (i > 0 && j > 0) {
        if (firstSequence[i - 1] === secondSequence[j - 1]) {
          subsequence.push(firstSequence[i - 1]);
          i -= 1;
          j -= 1;
        } else {
          if (dynamicTable[i - 1][j] >= dynamicTable[i][j - 1]) {
            i -= 1;
          } else {
            j -= 1;
          }
        }
      }
      return subsequence.reverse().join('');
    };
    if (reconstructSubsequence) {
      return reconstructLcs();
    } else {
      return lcsSize();
    }
  };

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.longestCommonSubsequence = longestCommonSubsequence;

}).call(this);
;(function() {
  var Comparator;

  Comparator = (function() {
    function Comparator(compareFn) {
      if (compareFn !== void 0) {
        this.compare = compareFn;
      }
    }

    Comparator.prototype.compare = function(a, b) {
      if (a === b) {
        return 0;
      } else if (a < b) {
        return -1;
      } else {
        return 1;
      }
    };

    Comparator.prototype.equal = function(a, b) {
      return this.compare(a, b) === 0;
    };

    Comparator.prototype.lesserThan = function(a, b) {
      return this.compare(a, b) < 0;
    };

    Comparator.prototype.lesserThanOrEqual = function(a, b) {
      return this.lesserThan(a, b) || this.equal(a, b);
    };

    Comparator.prototype.greaterThan = function(a, b) {
      return this.compare(a, b) > 0;
    };

    Comparator.prototype.greaterThanOrEqual = function(a, b) {
      return this.greaterThan(a, b) || this.equal(a, b);
    };

    return Comparator;

  })();

  this.algCoffee = this.algCoffee ? this.algCoffee : {};

  this.algCoffee.Comparator = Comparator;

}).call(this);
