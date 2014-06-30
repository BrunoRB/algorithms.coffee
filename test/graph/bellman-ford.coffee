### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
bellmanFord = require('../../algorithms').bellmanFord
AdjacencyList = require('../../algorithms').AdjacencyList

describe 'Bellman-Ford', ->

    describe 'Shortest Paths in a Directed Graph', ->
        directedGraph = new AdjacencyList
            
        directedGraph.addEdge 'a', 'b', -1
        directedGraph.addEdge 'a', 'c', 4
        directedGraph.addEdge 'b', 'c', 3
        directedGraph.addEdge 'b', 'd', 2
        directedGraph.addEdge 'b', 'e', 2
        directedGraph.addEdge 'd', 'b', 1
        directedGraph.addEdge 'e', 'd', -3
        directedGraph.addEdge 'd', 'c', 5
    
        it 'shoud get the shortest paths in the Directed Graph without Negative-weighted Cycles', ->
            shortestPaths = bellmanFord(directedGraph, 'a').distance

            assert.strictEqual(shortestPaths['a'], 0, 'The distance to get to A from A is 0')
            assert.strictEqual(shortestPaths['d'], -2, 'The distance to get to A from D is -2')
            assert.strictEqual(shortestPaths['e'], 1, 'The distance to get to A from E is 1')
            
        it 'should create a Negative-weighted Cycle, and get a empty Object as the distances', ->
            directedGraph.addEdge('c', 'a', -9)
            
            shortestPaths = bellmanFord(directedGraph, 'a').distance
            
            assert.isUndefined(shortestPaths['a'], 'There\'s a Negative-weighted Cycle in the graph!')
            assert.isObject(shortestPaths, 'The distances is a empty object')
            
    describe 'Shortest Paths in a Undirected Graph', ->
        undirectedGraph = new AdjacencyList false
            
        undirectedGraph.addEdge 'a', 'b', 9
        undirectedGraph.addEdge 'a', 'c', 1
        undirectedGraph.addEdge 'b', 'c', 13
    
        it 'shoud get the shortest paths in the Undirected Graph without Negative-weighted Cycles', ->
            shortestPaths = bellmanFord(undirectedGraph, 'a').distance

            assert.strictEqual(shortestPaths['a'], 0, 'The distance to get to A from A is 0')
            assert.strictEqual(shortestPaths['b'], 9, 'The distance to get to A from B is 9')
            assert.strictEqual(shortestPaths['c'], 1, 'The distance to get to A from C is 1')
            
        it 'should create a Negative-weighted Cycle, and get a empty Object as the distances', ->
            undirectedGraph.addEdge('a', 'c', -666)
            
            shortestPaths = bellmanFord(undirectedGraph, 'a').distance
            
            assert.isUndefined(shortestPaths['a'], 'There\'s a Negative-weighted Cycle in the graph!')
            assert.isObject(shortestPaths, 'The distances is a empty object')
            
