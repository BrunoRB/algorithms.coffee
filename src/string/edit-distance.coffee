### @author Tayllan Búrigo 2014 ###

editDistance = (firstSequence, secondSequence, operationCost = 1) ->
    firstSequenceLength = firstSequence.length
    secondSequenceLength = secondSequence.length
    dynamicTable = []

    for i in [0..firstSequenceLength] by 1
        dynamicTable.push([])

        for j in [0..secondSequenceLength] by 1
            dynamicTable[i].push(0)

    for i in [0..firstSequenceLength] by 1
        dynamicTable[i][0] = i

    for i in [0..secondSequenceLength] by 1
        dynamicTable[0][i] = i

    for i in [1..firstSequenceLength] by 1
        for j in [1..secondSequenceLength] by 1
            if firstSequence[i - 1] is secondSequence[j - 1]
                dynamicTable[i][j] = dynamicTable[i - 1][j - 1]
            else
                insertion = dynamicTable[i][j - 1] + operationCost
                deletion = dynamicTable[i - 1][j] + operationCost
                substitution = dynamicTable[i - 1][j - 1] + operationCost

                dynamicTable[i][j] = Math.min(
                    insertion,
                    Math.min(
                        deletion,
                        substitution
                    )
                )

    return dynamicTable[firstSequenceLength][secondSequenceLength]

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.editDistance = editDistance
