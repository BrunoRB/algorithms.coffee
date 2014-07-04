### @author Tayllan Búrigo 2014 ###

if typeof module isnt 'undefined'
    AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList
else
    AdjacencyList = algCoffee.AdjacencyList

edmondsKarp = (graph, sourceVertex, sinkVertex) ->
    sourceVertex += ''
    sinkVertex += ''

    createResidualGraph = () ->
        residualGraph = new AdjacencyList()

        for source, value of graph.edges
            for target, weight of value
                if graph.getEdgeWeight(target, source) is undefined
                    residualGraph.addEdge(target, source, 0)
                residualGraph.addEdge(source, target, weight)

        return residualGraph

    eliminateAntiParallelEdges = () ->
        for source, value of residualGraph.edges
            for target, weight of value

                # if exists an AntiParallel Edge
                if residualGraph.edges[target][source] isnt undefined

                    # creating a new Vertex
                    newVertex = parseInt(Math.random() * residualGraph.amountOfVertices * 10)

                    # while the new Vertex already exists, change its name
                    while residualGraph.edges[newVertex] isnt undefined
                        newVertex = parseInt(Math.random() * residualGraph.amountOfVertices * 10)

                    residualGraph.addEdge(source, newVertex, weight)
                    residualGraph.addEdge(newVertex, target, weight)
                    residualGraph.deleteEdge(source, target)

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
                    residualGraph.edges[parent][v] -= maximumFlowThroughPath[sinkVertex]
                    residualGraph.edges[v][parent] += maximumFlowThroughPath[sinkVertex]

                    # if the edge reached 0 of capacity it's better just delete it
                    if residualGraph.edges[parent][v] is 0
                        residualGraph.deleteEdge(parent, v)
                    v = parent
                    parent = parents[parent]

                return maximumFlowThroughPath[sinkVertex]

            currentVertexRoommates = residualGraph.getRoommates(currentVertex)

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

    residualGraph = createResidualGraph()
    eliminateAntiParallelEdges()
    maximumFlow = 0
    aux = 0

    # while there's an Augmenting Path from Source to Sink add the flow through it
    while (aux = findAugmentingPath(sourceVertex, sinkVertex)) isnt undefined
        maximumFlow += aux

    return maximumFlow

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.edmondsKarp = edmondsKarp
