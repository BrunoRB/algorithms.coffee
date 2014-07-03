### @author Tayllan Búrigo 2014 ###

###
    @param{Array} the first sequence (of chars or ints)
    @param{Array} the second sequence (of chars or ints)
    @param{Boolean, optional}
    @return{String or Integer}
        if the Boolean parameter is TRUE
            returns the Longest Common Subsequence in a String
            e.g.: 'abc'
        else
            returns the size of the LCS
            e.g.: 3
###
longestCommonSubsequence = (firstSequence, secondSequence, reconstructSubsequence = false) ->
    firstLength = firstSequence.length
    secondLength = secondSequence.length

    lcsSize = () ->
        previousLine = []

        for i in [0..secondLength] by 1
            previousLine[i] = 0

        for charFirstSequence in firstSequence
            previousValue = 0

            for i in [1..secondLength] by 1
                if charFirstSequence is secondSequence[i - 1]
                    [previousLine[i], previousValue] = [previousValue + 1, previousLine[i]]
                else
                    previousValue = previousLine[i]
                    previousLine[i] = Math.max(
                        previousLine[i - 1],
                        previousLine[i]
                    )

        return previousLine[secondLength]

    reconstructLcs = () ->
        dynamicTable = []

        for i in [0..firstLength] by 1
            dynamicTable.push([])
            for j in [0..secondLength] by 1
                dynamicTable[i].push(0)

        for i in [1..firstLength] by 1
            for j in [1..secondLength] by 1
                if firstSequence[i - 1] is secondSequence[j - 1]
                    dynamicTable[i][j] = dynamicTable[i - 1][j - 1] + 1
                else
                    dynamicTable[i][j] = Math.max(
                        dynamicTable[i - 1][j],
                        dynamicTable[i][j - 1]
                    )

        subsequence = []
        i = firstLength
        j = secondLength

        while i > 0 and j > 0
            if firstSequence[i - 1] is secondSequence[j - 1]
                subsequence.push(firstSequence[i - 1])
                i -= 1
                j -= 1
            else
                if dynamicTable[i - 1][j] >= dynamicTable[i][j - 1]
                    i -= 1
                else
                    j -= 1

        return subsequence.reverse().join('')

    if reconstructSubsequence
        return reconstructLcs()
    else
        return lcsSize()

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.longestCommonSubsequence = longestCommonSubsequence
