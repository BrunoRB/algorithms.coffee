### @author Tayllan Búrigo 2014 ###

if typeof module isnt 'undefined'
    DisjointSet = require('./../data-structures/disjoint-set').algCoffee.DisjointSet
else
    DisjointSet = algCoffee.DisjointSet

kruskal = (graph) ->
    minimumSpanningTree = 0.0
    set = new DisjointSet(graph.vertices)
    sortedEdges = []

    for source, value of graph.edges
        for target, weight of value
            sortedEdges.push([source, target, weight])

    sortedEdges.sort((a, b) -> return a[2] - b[2])

    for edge in sortedEdges
        if set.find(edge[0]) isnt set.find(edge[1])
            minimumSpanningTree += edge[2]
            set.union(edge[0], edge[1])

    return minimumSpanningTree

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.kruskal = kruskal
