### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
kosaraju = require('../../algorithms').kosaraju
AdjacencyList = require('../../algorithms').AdjacencyList

describe 'Kosaraju', ->

    describe 'Strongly Connected Components in a Directed Graph', ->
        directedGraph = new AdjacencyList

        directedGraph.addEdge 'a', 'b'
        directedGraph.addEdge 'b', 'a'
        directedGraph.addEdge 'a', 'c'
        directedGraph.addEdge 'c', 'a'
        directedGraph.addEdge 'c', 'd'
        directedGraph.addEdge 'e', 'd'
        directedGraph.addEdge 'f', 'e'
        directedGraph.addEdge 'f', 'g'
        directedGraph.addEdge 'g', 'f'

        it 'should get the Strongly Connected Components from de Directed Graph', ->
            stronglyConnectedComponents = kosaraju directedGraph

            assert.isArray stronglyConnectedComponents, 'The Components are in a Array'
            assert.strictEqual stronglyConnectedComponents.length, 4, 'There are four SCC'

            assert.strictEqual stronglyConnectedComponents[0].length, 2, 'The Component made by F and G'
            assert.strictEqual stronglyConnectedComponents[1].length, 1, 'The Component made by E'
            assert.strictEqual stronglyConnectedComponents[2].length, 3, 'The Component made by A, B and C'
            assert.strictEqual stronglyConnectedComponents[3].length, 1, 'The Component made by D'


    # although Kosaraju is not the recomended algorithm to find Connected Components in a Undirected Graph
    describe 'Connected Components in a Undirected Graph', ->
        undirectedGraph = new AdjacencyList false

        undirectedGraph.addEdge 'a', 'b'
        undirectedGraph.addEdge 'e', 'f'
        undirectedGraph.addVertex 'c'
        undirectedGraph.addVertex 'd'

        it 'should get the Connected Components from de Undirected Graph', ->
            connectedComponents = kosaraju undirectedGraph

            assert.isArray connectedComponents, 'The Components are in a Array'
            assert.strictEqual connectedComponents.length, 4, 'There are four CC'

            assert.strictEqual connectedComponents[0].length, 1, 'The Component made by D'
            assert.strictEqual connectedComponents[1].length, 1, 'The Component made by C'
            assert.strictEqual connectedComponents[2].length, 2, 'The Component made by E and F'
            assert.strictEqual connectedComponents[3].length, 2, 'The Component made by A and B'
