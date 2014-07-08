### @author Bruno Roberto Búrigo 2014 ###

expect = require('chai').expect
breadthFirstSearch = require('../../algorithms').breadthFirstSearch
AdjacencyList = require('../../algorithms').AdjacencyList

describe 'Breadth First Search', ->

    describe 'Traverse', ->
        graph = new AdjacencyList()

        graph.addEdge 'a', 'b'
        graph.addEdge 'a', 'c'
        graph.addEdge 'a', 'd'
        graph.addEdge 'c', 'e'
        graph.addEdge 'e', 'd'
        graph.addVertex 'f'

        it 'should simply traverse the graph', ->
            expect(breadthFirstSearch(graph)).to.be.equal true

        it 'should add a new edge that points to all other vertices on the graph', ->
            fn = (vertex) ->
                @addEdge('k', vertex)

            expect(breadthFirstSearch(graph, fn)).to.be.equal true

            expect(graph.edges).to.have.property('k')

            for i in ['a', 'b', 'c', 'd', 'e', 'f']
                expect(graph.edges.k).to.have.property(i)
