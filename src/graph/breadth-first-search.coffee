### @author Bruno Roberto Búrigo 2014 ###

breadthFirstSearch = (graph, fn) ->
    visited = {}
    queue = []
    for vertex in graph.vertices
        queue.push(vertex)

        while queue.length > 0
            v = queue.shift()
            if v in visited == false
                fn?.call(graph, v)
                visited[v] = true

                for u in graph.getRoommates(v)
                    queue.push(u)

    return true

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.breadthFirstSearch = breadthFirstSearch
