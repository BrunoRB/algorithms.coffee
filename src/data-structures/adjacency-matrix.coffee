### @author Tayllan Búrigo 2014 ###

class AdjacencyMatrix
    constructor: (@directed = true) ->
        @adjacencyMatrix = []
        @mapping = {}
        @amountOfVertices = 0
        @amountOfEdges = 0

    addVertex: (vertex) ->
        @mapping[vertex] = @amountOfVertices

        @adjacencyMatrix.push([])

        for i in [0..@amountOfVertices] by 1
            @adjacencyMatrix[@amountOfVertices][i] = undefined
            @adjacencyMatrix[i][@amountOfVertices] = undefined

        @amountOfVertices += 1

    addEdge: (source, target, weight = 1) ->

        # in case the Vertex hasn't already been added to the AdjacecyMatrix
        if @mapping[source] is undefined
            @addVertex(source)

        # in case the Vertex hasn't already been added to the AdjacecyMatrix
        if @mapping[target] is undefined
            @addVertex(target)

        sourceIndex = @mapping[source]
        targetIndex = @mapping[target]

        @adjacencyMatrix[sourceIndex][targetIndex] = weight
        @amountOfEdges += 1

        if not @directed
            @adjacencyMatrix[targetIndex][sourceIndex] = weight
            @amountOfEdges += 1

    deleteEdge: (source, target) ->
        if @mapping[source] isnt undefined and @mapping[target] isnt undefined
            sourceIndex = @mapping[source]
            targetIndex = @mapping[target]

            @adjacencyMatrix[sourceIndex][targetIndex] = undefined
            @amountOfEdges -= 1

            if not @directed
                @adjacencyMatrix[targetIndex][sourceIndex] = undefined
                @amountOfEdges -= 1

    getEdgeWeight: (source, target) ->
        if @mapping[source] isnt undefined and @mapping[target] isnt undefined
            sourceIndex = @mapping[source]
            targetIndex = @mapping[target]

            return @adjacencyMatrix[sourceIndex][targetIndex]

    getRoommates: (vertex) ->
        if @mapping[vertex] isnt undefined
            vertexIndex = @mapping[vertex]

            return @adjacencyMatrix[vertexIndex]

    toString: () ->
        return 'Adjacency Matrix with ' + @amountOfVertices + ' vertices and ' + @amountOfEdges + ' edges.'

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.AdjacencyMatrix = AdjacencyMatrix
