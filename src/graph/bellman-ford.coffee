### @author Tayllan Búrigo 2014 ###

bellmanFord = (graph, startVertex) ->
    minimumDistances = {}

    for vertex in graph.vertices
        minimumDistances[vertex] = Infinity

    minimumDistances[startVertex] = 0.0

    for i in [0...graph.amountOfVertices - 1] by 1
        for source, value of graph.edges
            for target, weight of value
                sourceDistance = minimumDistances[source] + weight
                targetDistance = minimumDistances[target]

                if sourceDistance < targetDistance
                    minimumDistances[target] = sourceDistance

    for source, value of graph.edges
        for target, weight of value
            sourceDistance = minimumDistances[source] + weight
            targetDistance = minimumDistances[target]

            if sourceDistance < targetDistance
                return {
                    distance: {}
                }

    return {
        distance: minimumDistances
    }

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.bellmanFord = bellmanFord
