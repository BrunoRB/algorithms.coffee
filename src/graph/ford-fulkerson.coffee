### @author Tayllan Búrigo 2014 ###

if typeof module isnt 'undefined'
    AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList
else
    AdjacencyList = algCoffee.AdjacencyList

fordFulkerson = (initialGraph, sourceVertex, sinkVertex) ->
    sourceVertex += ''
    sinkVertex += ''

    # clones the given graph so that the original one is not afected by the eventual deletion of edges
    cloneGraph = () ->
        graph = new AdjacencyList

        for source, value of initialGraph.edges
            for target, weight of value
                graph.addEdge(source, target, weight)

        return graph

    eliminateAntiParallelEdges = () ->
        for source, value of graph.edges
            for target, weight of value

                # if exists an AntiParallel Edge
                if graph.edges[target][source] isnt undefined

                    # creating a new Vertex
                    newVertex = parseInt(Math.random() * graph.amountOfVertices * 10)

                    # while the new Vertex already exists, change its name
                    while graph.edges[newVertex] isnt undefined
                        newVertex = parseInt(Math.random() * graph.amountOfVertices * 10)

                    graph.addEdge(source, newVertex, weight)
                    graph.addEdge(newVertex, target, weight)
                    graph.deleteEdge(source, target)

    findAugmentingPath = (sourceVertex, sinkVertex) ->

        # to travel backwards the path through which flow will pass
        parents = {}

        # the maximum flow that can pass through every Vertex in the path (giving their capacities)
        maximumFlowThroughPath = {}
        visitedVertices = {}
        queue = []

        visitedVertices[sourceVertex] = true
        queue.push(sourceVertex)

        while queue.length > 0
            currentVertex = queue.shift()

            # the path to the SinkVertex has been found. Now the path must have its flow diminished
            if currentVertex is sinkVertex
                v = sinkVertex
                parent = parents[v]

                while parent isnt undefined
                    graph.edges[parent][v] -= maximumFlowThroughPath[sinkVertex]

                    # if the edge reached 0 of capacity it's better just delete it
                    if graph.edges[parent][v] is 0
                        graph.deleteEdge(parent, v)
                    v = parent
                    parent = parents[parent]

                return maximumFlowThroughPath[sinkVertex]

            currentVertexRoommates = graph.getRoommates(currentVertex)

            for target, weight of currentVertexRoommates
                if visitedVertices[target] is undefined
                    parents[target] = currentVertex
                    if maximumFlowThroughPath[currentVertex] is undefined
                        maximumFlowThroughPath[target] = weight
                    else
                        maximumFlowThroughPath[target] = Math.min(
                            maximumFlowThroughPath[currentVertex],
                            weight
                        )
                    visitedVertices[target] = true
                    queue.push(target)

        # there's no path from SourceVertex to SinkVertex
        return undefined

    graph = cloneGraph()
    eliminateAntiParallelEdges()
    maximumFlow = 0
    aux = 0

    # while there's an Augmenting Path from Source to Sink add the flow through it
    while (aux = findAugmentingPath(sourceVertex, sinkVertex)) isnt undefined
        maximumFlow += aux

    return maximumFlow

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.fordFulkerson = fordFulkerson
