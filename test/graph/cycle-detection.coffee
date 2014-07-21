### @author Tayllan Búrigo 2014 ###

expect = require('chai').expect
cycleDetection = require('../../algorithms').cycleDetection
AdjacencyList = require('../../algorithms').AdjacencyList

describe 'Cycle Detection', ->

    describe 'Detects if a graph has a cyle or not', ->
        it 'shoud detect cycles within a Directed Graph', ->
            directedGraph = new AdjacencyList true

            # no cycle so far
            directedGraph.addEdge 'a', 'b'
            directedGraph.addEdge 'a', 'c'
            directedGraph.addEdge 'b', 'c'

            expect(cycleDetection(directedGraph)).to.be.false

            # adding a cycle
            directedGraph.addEdge 'c', 'b'

            expect(cycleDetection(directedGraph)).to.be.true

        it 'shoud detect cycles within an Undirected Graph', ->
            undirectedGraph = new AdjacencyList false

            # every Undirected Graph with edges has a cycle by default
            undirectedGraph.addEdge 'a', 'b'

            expect(cycleDetection(undirectedGraph)).to.be.true
