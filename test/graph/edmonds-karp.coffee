### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
edmondsKarp = require('../../algorithms').edmondsKarp
AdjacencyList = require('../../algorithms').AdjacencyList

describe 'Edmonds-Karp', ->

    describe 'Maximum Flow that can pass through a network modeled in a Directed Grah', ->
        directedGraph = new AdjacencyList

        directedGraph.addEdge 0, 1, 16
        directedGraph.addEdge 0, 5, 13
        directedGraph.addEdge 1, 2, 12
        directedGraph.addEdge 2, 3, 20
        directedGraph.addEdge 2, 5, 9
        directedGraph.addEdge 4, 2, 7
        directedGraph.addEdge 4, 3, 4
        directedGraph.addEdge 5, 1, 4
        directedGraph.addEdge 5, 4, 14

        maximumFlow = edmondsKarp directedGraph, 0, 3

        it 'should assert the maximum flow', ->
            assert.strictEqual maximumFlow, 23, 'The flow of 23 is obtained with the following Augmenting Paths:' +
                '0 --> 1 --> 2 --> 3 with value of 12' +
                '0 --> 5 --> 4 --> 3 with value of 3' +
                ' and ' +
                '0 --> 5 --> 4 --> 2 --> 3 with value of 7'

        it 'should assert that the original graph wasn\'t modified by the function call', ->
            assert.strictEqual directedGraph.amountOfEdges, 9, 'The same amount of Edges as the original'
            assert.strictEqual directedGraph.amountOfVertices, 6, 'The same amount of Vertices'

    describe 'Maximum Flow that can pass through a network modeled in a Directed Grah (2)', ->
        graph = new AdjacencyList

        graph.addEdge 0, 1
        graph.addEdge 0, 5
        graph.addEdge 0, 6
        graph.addEdge 1, 2
        graph.addEdge 1, 4
        graph.addEdge 5, 2
        graph.addEdge 5, 7
        graph.addEdge 6, 7
        graph.addEdge 2, 3
        graph.addEdge 4, 3
        graph.addEdge 7, 3

        maximumFlow = edmondsKarp graph, 0, 3

        it 'should assert the maximum flow. This test uses Reverse Edges to send more flow', ->
            assert.strictEqual maximumFlow, 3, 'The flow of 3 is obtained with the following Augmenting Paths:' +
                '0 --> 1 --> 2 --> 3 with value of 1' +
                '0 --> 5 --> 7 --> 3 with value of 1' +
                ' and the the path with Reverse Edges: ' +
                '0 --> 6 --> 7 --> 5 --> 2 --> 1 --> 4 --> 3 with value of 1'

    describe 'Maximum Flow that can pass through a network modeled in a Undirected Grah', ->
        undirectedGraph = new AdjacencyList false

        undirectedGraph.addEdge 0, 1, 10
        undirectedGraph.addEdge 0, 2, 5
        undirectedGraph.addEdge 0, 3, 13
        undirectedGraph.addEdge 1, 2, 6
        undirectedGraph.addEdge 1, 3, 8
        undirectedGraph.addEdge 2, 3, 7

        maximumFlow = edmondsKarp undirectedGraph, 0, 3

        it 'should assert the maximum flow in the Undirect Graph (all edges are AntiParallel Edges)', ->
            assert.strictEqual maximumFlow, 28, 'The flow of 28 is obtained with the following Augmenting Paths:' +
                '0 --> 3 with value of 13' +
                '0 --> 1 --> 3 with value of 8' +
                '0 --> 2 --> 3 with value of 5' +
                ' and ' +
                '0 --> 1 --> 2 --> 3 with value of 2'

        it 'should assert that the original graph wasn\'t modified by the function call', ->
            assert.strictEqual undirectedGraph.amountOfEdges, 12, 'The same amount of Edges as the original'
            assert.strictEqual undirectedGraph.amountOfVertices, 4, 'The same amount of Vertices'
