### @author Tayllan Búrigo 2014 ###

depthFirstSearch = (graph, fn) ->
    visitedVertices = {}

    dfs = (vertex) ->
        visitedVertices[vertex] = true

        for roommate, weight of graph.getRoommates(vertex)
            if visitedVertices[roommate] is undefined
                dfs(roommate)

        fn?.call(graph, vertex)

    for vertex in graph.vertices
        if visitedVertices[vertex] is undefined
            dfs(vertex)

    return true

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.depthFirstSearch = depthFirstSearch
