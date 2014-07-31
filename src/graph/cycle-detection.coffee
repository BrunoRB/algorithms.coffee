### @author Tayllan Búrigo 2014 ###

cycleDetection = (graph) ->
    recursionStack = {}
    visited = {}

    dfs = (vertex) ->
        visited[vertex] = true
        recursionStack[vertex] = true
        roommates = graph.getRoommates(vertex)

        for target, weight of roommates
            if visited[target] is undefined and dfs(target)
                return true
            else if recursionStack[target]
                return true

        delete recursionStack[vertex]
        return false

    for vertex in graph.vertices
        if dfs(vertex)
            return true

    return false

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.cycleDetection = cycleDetection
