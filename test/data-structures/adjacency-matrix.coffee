### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
AdjacencyMatrix = require('../../algorithms').AdjacencyMatrix

describe 'Adjacency Matrix', ->

    describe 'The Adjacency Matrix representation of a Directed Graph', ->
        directedGraph = new AdjacencyMatrix

        directedGraph.addEdge 'a', 'b', -1
        directedGraph.addEdge 'a', 'c', 4
        directedGraph.addEdge 'b', 'c', 3
        directedGraph.addEdge 'b', 'd', 2
        directedGraph.addEdge 'b', 'e', 2
        directedGraph.addEdge 'd', 'b', 1
        directedGraph.addEdge 'e', 'd', -3
        directedGraph.addEdge 'd', 'c', 5

        it 'should assert the attributes from the Adjacency Matrix', ->
            assert.isObject directedGraph.mapping, 'The object that maps each vertex to it\'s corresponding Row'
            assert.isArray directedGraph.adjacencyMatrix
            assert.strictEqual(
                directedGraph.adjacencyMatrix.length,
                directedGraph.amountOfVertices,
                'There is as much Rows in the matrix as there is Vertices'
            )

            for row in directedGraph.adjacencyMatrix
                assert.isArray row
                assert.strictEqual(
                    row.length,
                    directedGraph.amountOfVertices,
                    'There is as much Columns in each Row of the Matrix as there is Vertices'
                )

            assert.isNumber directedGraph.amountOfVertices
            assert.isNumber directedGraph.amountOfEdges

        it 'should assert the size of the Directed Graph and the Edges Weights', ->
            assert.strictEqual directedGraph.amountOfVertices, 5, 'The graph contains Five Vertices'
            assert.strictEqual directedGraph.amountOfEdges, 8, 'The graph contains Eight Edges'

            directedGraph.deleteEdge 'a', 'c'

            assert.strictEqual directedGraph.amountOfEdges, 7, 'The graph contains one less Edge'
            assert.strictEqual directedGraph.getEdgeWeight('b', 'e'), 2, 'The Edge between B and E has weight of 2'
            assert.isUndefined directedGraph.getEdgeWeight('a', 'c'), 'The Edge between A and C has just been deleted'

        it 'should get the Roommates (neighboors) from the Vertex E', ->
            eRoommates = directedGraph.getRoommates 'e'

            aIndex = directedGraph.mapping['a']
            dIndex = directedGraph.mapping['d']

            assert.isArray eRoommates, 'The Vertices that are connected to E'
            assert.isUndefined eRoommates[aIndex], 'There is no connection from E to A'
            assert.strictEqual eRoommates[dIndex], -3, 'There is a connection from E to D, and it\'s weight is -3'

    describe 'The Adjacency Matrix representation of a Undirected Graph', ->
        undirectedGraph = new AdjacencyMatrix false

        undirectedGraph.addEdge 'A', 'B', 9
        undirectedGraph.addEdge 'A', 'C'
        undirectedGraph.addEdge 'B', 'C', 13

        it 'should assert the size of the Undirected Graph and the Edges Weights', ->
            assert.strictEqual undirectedGraph.amountOfVertices, 3, 'The graph contains Three Vertices'
            assert.strictEqual undirectedGraph.amountOfEdges, 6, 'The graph contains Six Edges, since is Undirected'

            undirectedGraph.deleteEdge 'A', 'B'

            assert.strictEqual undirectedGraph.amountOfEdges, 4, 'The graph contains one less Edge'
            assert.strictEqual(
                undirectedGraph.getEdgeWeight('A', 'C'),
                1,
                'The Edge between A and C has the default weight of 1'
            )
            assert.isUndefined undirectedGraph.getEdgeWeight('A', 'B'), 'The Edge between A and B has just been deleted'

        it 'should get the Roommates (neighboors) from the Vertex B', ->
            bRoommates = undirectedGraph.getRoommates 'B'

            dIndex = undirectedGraph.mapping['D']
            cIndex = undirectedGraph.mapping['C']

            assert.isArray bRoommates, 'The Vertices that are connected to B'
            assert.isUndefined bRoommates[dIndex], 'There is no connection from B to D'
            assert.strictEqual bRoommates[cIndex], 13, 'There is a connection from B to C, and it\'s weight is 13'
