### @author Tayllan Búrigo 2014 ###

if typeof module isnt 'undefined'
    depthFirstSearch = require('./depth-first-search').algCoffee.depthFirstSearch
    AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList
else
    depthFirstSearch = algCoffee.depthFirstSearch
    AdjacencyList = algCoffee.AdjacencyList

kosaraju = (graph) ->
    getReverseGraph = () ->
        reverseGraph = new AdjacencyList(graph.directed)

        for vertex in graph.vertices
            reverseGraph.addVertex(vertex)

        for source, value of graph.edges
            for target, weight of value
                reverseGraph.addEdge(target, source, weight)

        reverseGraph.finishingQueue = graph.finishingQueue

        return reverseGraph

    mappingComponents = (vertex) ->
        stack = []
        localComponent = []

        stack.push(vertex)

        while stack.length > 0
            currentVertex = stack.pop()
            visitedVertices[currentVertex] = true
            localComponent.push(currentVertex)

            for vertex, weight of reverseGraph.getRoommates(currentVertex)
                if visitedVertices[vertex] is undefined
                    stack.push(vertex)

        return localComponent

    fn = (vertex) ->
        @finishingQueue.push(vertex)

    # adding the needed attribute
    graph.finishingQueue = []
    depthFirstSearch(graph, fn)
    graph.finishingQueue = graph.finishingQueue.reverse()

    connectedComponents = []
    visitedVertices = {}
    reverseGraph = getReverseGraph()

    for vertex in graph.finishingQueue
        if visitedVertices[vertex] is undefined
            connectedComponents.push(mappingComponents(vertex))

    # deleting the new attribute to avoid possible conflicts
    delete graph.finishingQueue

    return connectedComponents

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.kosaraju = kosaraju
