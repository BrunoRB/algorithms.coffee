### @author Tayllan Búrigo 2014 ###

expect = require('chai').expect
depthFirstSearch = require('../../algorithms').depthFirstSearch
AdjacencyList = require('../../algorithms').AdjacencyList

describe 'Depth First Search', ->

    describe 'Depth First Search in a Directed Graph with Simple function', ->
        directedGraph = new AdjacencyList

        directedGraph.addEdge 'a', 'b'
        directedGraph.addEdge 'a', 'c'
        directedGraph.addEdge 'a', 'd'
        directedGraph.addEdge 'c', 'e'
        directedGraph.addEdge 'e', 'd'
        directedGraph.addVertex 'f'

        it 'should simply traverse the graph', ->
            expect(depthFirstSearch(directedGraph)).to.be.equal true

        it 'should add a new edge that points to all other vertices on the graph', ->
            fn = (vertex) ->
                @addEdge 'k', vertex

            expect(depthFirstSearch(directedGraph, fn)).to.be.equal true

            expect(directedGraph.edges).to.have.property 'k'

            for i in ['a', 'b', 'c', 'd', 'e', 'f']
                expect(directedGraph.edges.k).to.have.property i

    describe 'Depth First Search in a Directed Graph with Finishing Queue function', ->
        directedGraph = new AdjacencyList

        directedGraph.addEdge 'a', 'b'
        directedGraph.addEdge 'a', 'c'
        directedGraph.addEdge 'd', 'a'
        directedGraph.addEdge 'c', 'e'
        directedGraph.addEdge 'e', 'd'
        directedGraph.addVertex 'f'

        # adding the needed attribute
        directedGraph.finishingQueue = []

        it 'should simply traverse the graph', ->
            expect(depthFirstSearch(directedGraph)).to.be.equal true

        it 'should add the vertices to the finishingQueue in the order in which they are visited', ->
            fn = (vertex) ->
                @finishingQueue.push vertex

            correctOrder = ['b', 'd', 'e', 'c', 'a', 'f']

            expect(depthFirstSearch(directedGraph, fn)).to.be.equal true

            expect(directedGraph.finishingQueue).to.be.deep.equal correctOrder
