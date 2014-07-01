### @author Tayllan Búrigo 2014 ###

if typeof module isnt 'undefined'
    depthFirstSearch = require('./depth-first-search').algCoffee.depthFirstSearch
    AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList
else
    depthFirstSearch = algCoffee.depthFirstSearch
    AdjacencyList = algCoffee.AdjacencyList

kosaraju = (graph) ->
    revertGraph = () ->
        reverseGraph = new AdjacencyList(graph.directed)

        for vertex in graph.vertices
            reverseGraph.addVertex(vertex)

        for source, value of graph.edges
            for target, weight of value
                reverseGraph.addEdge(target, source, weight)

        graph = reverseGraph

    mappingComponents = (vertex) ->
        stack = []
        localComponent = []

        stack.push(vertex)

        while stack.length > 0
            currentVertex = stack.pop()
            visitedVertices[currentVertex] = true
            localComponent.push(currentVertex)

            for vertex, weight of graph.getRoommates(currentVertex)
                if visitedVertices[vertex] is undefined
                    stack.push(vertex)

        return localComponent

    finishingTimes = depthFirstSearch(graph)
    sortedFinishingTimes = []

    for vertex, finishingTime of finishingTimes
        sortedFinishingTimes.push([vertex, finishingTime])

    sortedFinishingTimes.sort((a, b) -> return b[1] - a[1])

    connectedComponents = []
    visitedVertices = {}
    revertGraph()

    for vertexArray in sortedFinishingTimes
        vertex = vertexArray[0]
        if visitedVertices[vertex] is undefined
            connectedComponents.push(mappingComponents(vertex))

    return connectedComponents

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.kosaraju = kosaraju
