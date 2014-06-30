### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
depthFirstSearch = require('../../algorithms').depthFirstSearch
AdjacencyList = require('../../algorithms').AdjacencyList

describe 'Depth First Search', ->

    describe 'Depth First Search with finishing times in a Directed Graph', ->
        directedGraph = new AdjacencyList

        directedGraph.addEdge 'a', 'b'
        directedGraph.addEdge 'a', 'c'
        directedGraph.addEdge 'a', 'd'
        directedGraph.addEdge 'c', 'e'
        directedGraph.addEdge 'e', 'd'
        directedGraph.addVertex 'f'

        it 'should get the finishing times for the dfs in the Directed Graph', ->
            finishingTimes = depthFirstSearch(directedGraph)

            assert.isObject(finishingTimes, 'FinishingTimes is a object')
            assert.isUndefined(finishingTimes['no'], 'There isn\'t a NO vertex')

            assert.strictEqual(finishingTimes['a'], 4, 'A was the fifth to finish')
            assert.strictEqual(finishingTimes['b'], 0, 'B was the first to finish')
            assert.strictEqual(finishingTimes['c'], 3, 'C was the fourth to finish')
            assert.strictEqual(finishingTimes['d'], 1, 'D was the second to finish')
            assert.strictEqual(finishingTimes['e'], 2, 'E was the third to finish')
            assert.strictEqual(finishingTimes['f'], 5, 'F was the sixth to finish')

    describe 'Depth First Search with finishing times in a Undirected Graph', ->
        undirectedGraph = new AdjacencyList false

        undirectedGraph.addEdge 'a', 'b'
        undirectedGraph.addEdge 'a', 'c'
        undirectedGraph.addEdge 'b', 'c'
        undirectedGraph.addVertex 'd'

        it 'should get the finishing times for the dfs in the Undirected Graph', ->
            finishingTimes = depthFirstSearch(undirectedGraph)

            assert.isObject(finishingTimes, 'FinishingTimes is a object')
            assert.isUndefined(finishingTimes['no'], 'There isn\'t a NO vertex')

            assert.strictEqual(finishingTimes['a'], 2, 'A was the third to finish')
            assert.strictEqual(finishingTimes['b'], 1, 'A was the second to finish')
            assert.strictEqual(finishingTimes['c'], 0, 'A was the first to finish')
            assert.strictEqual(finishingTimes['d'], 3, 'A was the fourth to finish')
