### @author Tayllan Búrigo 2014 ###

expect = require('chai').expect
floydWarshall = require('../../algorithms').floydWarshall
AdjacencyMatrix = require('../../algorithms').AdjacencyMatrix

describe 'Floyd-Warshall', ->

    describe 'All-pairs Shortest Path in a Directed Graph', ->
        directedGraph = new AdjacencyMatrix

        directedGraph.addEdge 0, 1, 7
        directedGraph.addEdge 0, 2, 1
        directedGraph.addEdge 0, 3, 6
        directedGraph.addEdge 1, 2, -2
        directedGraph.addEdge 2, 3, 8
        directedGraph.addEdge 3, 4, 2
        directedGraph.addEdge 4, 1, -7
        directedGraph.addEdge 4, 3, 10
        directedGraph.addEdge 3, 1, 5

        it 'should get the All-pairs Shortest Paths matrix', ->
            shortestPaths = [
                [ Infinity, 1, -1, 6, 8 ],
                [ Infinity, 1, -2, 6, 8 ],
                [ Infinity, 3, 1, 8, 10 ],
                [ Infinity, -5, -7, 1, 2 ],
                [ Infinity, -7, -9, -1, 1 ]
            ]

            expect(floydWarshall(directedGraph)).to.be.deep.equal shortestPaths

            # adds a Negative-weighted Cycle
            directedGraph.addEdge 2, 3, 1

            shortestPaths = directedGraph.adjacencyMatrix

            expect(floydWarshall(directedGraph)).to.be.deep.equal shortestPaths

    describe 'All-pairs Shortest Path in an Undirected Graph', ->
        undirectedGraph = new AdjacencyMatrix false

        undirectedGraph.addEdge 0, 1, 7
        undirectedGraph.addEdge 0, 2, 1
        undirectedGraph.addEdge 0, 3, 6
        undirectedGraph.addEdge 1, 2, 2
        undirectedGraph.addEdge 2, 3, 8
        undirectedGraph.addEdge 3, 4, 2
        undirectedGraph.addEdge 4, 1, 7
        undirectedGraph.addEdge 4, 3, 10
        undirectedGraph.addEdge 3, 1, 5

        it 'should get the All-pairs Shortest Paths matrix', ->
            shortestPaths = [
                [ 2, 3, 1, 6, 10 ],
                [ 3, 4, 2, 5, 7 ],
                [ 1, 2, 2, 7, 9 ],
                [ 6, 5, 7, 10, 10 ],
                [ 10, 7, 9, 10, 14 ]
            ]

            expect(floydWarshall(undirectedGraph)).to.be.deep.equal shortestPaths

            # adds a Negative-weighted Cycle
            undirectedGraph.addEdge 2, 3, -1

            shortestPaths = undirectedGraph.adjacencyMatrix

            expect(floydWarshall(undirectedGraph)).to.be.deep.equal shortestPaths
