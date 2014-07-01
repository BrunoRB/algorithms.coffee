### @author Tayllan Búrigo 2014 ###

depthFirstSearch = (graph) ->
    time = 0
    visitedVertices = {}
    finishingTimes = {}

    dfs = (vertex) ->
        visitedVertices[vertex] = true

        for roommate, weight of graph.getRoommates(vertex)
            if visitedVertices[roommate] is undefined
                dfs(roommate)

        finishingTimes[vertex] = time
        time += 1

    for vertex in graph.vertices
        if visitedVertices[vertex] is undefined
            dfs(vertex)

    return finishingTimes

@algCoffe = if @algCoffe then @algCoffe else {}
@algCoffe.depthFirstSearch = depthFirstSearch
