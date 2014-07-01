### @author Tayllan Búrigo 2014 ###

class AdjacencyList
    constructor: (@directed = true) ->
        @vertices = []
        @edges = {}
        @amountOfVertices = 0
        @amountOfEdges = 0

    addVertex: (vertex) ->
        @vertices.push(vertex)
        @edges[vertex] = {}
        @amountOfVertices += 1

    addEdge: (source, target, weight = 1) ->

        # in case the Vertex hasn't already been added to the AdjacecyList
        if @edges[source] is undefined
            @addVertex(source)

        # in case the Vertex hasn't already been added to the AdjacecyList
        if @edges[target] is undefined
            @addVertex(target)

        @edges[source][target] = weight
        @amountOfEdges += 1

        if not @directed
            @edges[target][source] = weight
            @amountOfEdges += 1

    deleteEdge: (source, target) ->
        if @edges[source] isnt undefined
            delete @edges[source][target]
            @amountOfEdges -= 1

            if not @directed and @edges[target] isnt undefined
                delete @edges[target][source]
                @amountOfEdges -= 1

    getEdgeWeight: (source, target) ->
        return @edges[source][target]

    getRoommates: (vertex) ->
        return @edges[vertex]

    toString: () ->
        return 'AdjacencyList with ' + @amountOfVertices + ' vertices and ' + @amountOfEdges + ' edges.'

@algCoffe = if @algCoffe then @algCoffe else {}
@algCoffe.AdjacencyList = AdjacencyList
