### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
kruskal = require('../../algorithms').kruskal
AdjacencyList = require('../../algorithms').AdjacencyList

describe 'Kruskal', ->

    describe 'Minimum Spanning Tree in a Graph', ->
        graph = new AdjacencyList false

        graph.addEdge 'a', 'b', 4
        graph.addEdge 'a', 'h', 8
        graph.addEdge 'h', 'b', 11
        graph.addEdge 'h', 'i', 7
        graph.addEdge 'h', 'g', 1
        graph.addEdge 'b', 'c', 8
        graph.addEdge 'c', 'd', 7
        graph.addEdge 'c', 'i', 2
        graph.addEdge 'c', 'f', 4
        graph.addEdge 'd', 'f', 14
        graph.addEdge 'd', 'e', 9
        graph.addEdge 'e', 'f', 10
        graph.addEdge 'g', 'i', 6
        graph.addEdge 'g', 'f', 2

        it 'should assert the value of the Minimum Spanning Tree', ->
            minimumSpanningTree = kruskal graph

            assert.strictEqual minimumSpanningTree, 37, 'The value of the MST of the Graph'
