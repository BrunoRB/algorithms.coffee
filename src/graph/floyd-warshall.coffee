### @author Tayllan Búrigo 2014 ###

floydWarshall = (graph) ->
    createEmptyMatrix = (length) ->
        emptyMatrix = []

        for i in [0...length] by 1
            emptyMatrix.push([])
            for j in [0...length] by 1
                emptyMatrix[i].push(0)

        return emptyMatrix

    length = graph.amountOfVertices
    adjacencyMatrix = graph.adjacencyMatrix
    auxiliaryMatrix = []

    # copying the original adjacency matrix so it won't be modified
    for i in [0...length] by 1
        auxiliaryMatrix.push([])
        for j in [0...length] by 1
            value = if adjacencyMatrix[i][j] is undefined then Infinity else adjacencyMatrix[i][j]
            auxiliaryMatrix[i].push(value)

    for k in [0...length] by 1
        newMatrix = createEmptyMatrix(length)
        for i in [0...length] by 1
            for j in [0...length] by 1
                newMatrix[i][j] = Math.min(
                    auxiliaryMatrix[i][j],
                    auxiliaryMatrix[i][k] + auxiliaryMatrix[k][j]
                )
        auxiliaryMatrix = newMatrix

    # detect Negative-weighted Cycle
    for i in [0...length] by 1

        # there is a Negative-weighted Cycle
        if auxiliaryMatrix[i][i] < 0
            return adjacencyMatrix

    return auxiliaryMatrix

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.floydWarshall = floydWarshall
