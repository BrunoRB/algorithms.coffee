### @author Tayllan Búrigo 2014 ###

if typeof module isnt 'undefined'
    AdjacencyList = require('./../data-structures/adjacency-list').algCoffee.AdjacencyList
else
    AdjacencyList = algCoffee.AdjacencyList

cycleDetection = (graph) ->
    list = []
    visited = {}

    list.push(graph.vertices[0])

    while list.length > 0
        currentVertex = list.shift()
        visited[currentVertex] = true
        roommates = graph.getRoommates(currentVertex)

        for target, weight of roommates
            if visited[target]
                return true
            else
                list.push(target)

    return false

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.cycleDetection = cycleDetection
