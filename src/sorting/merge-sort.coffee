### @author Bruno Roberto Búrigo 2014 ###

mergeSort = (array) ->

    divide = (array) ->
        if array.length == 1
            return array
        else
            halfLength = array.length // 2

            leftPart = array[0...halfLength]
            rigthPart = array[halfLength...array.length]

            left = divide(leftPart)
            right = divide(rigthPart)

            return merge(left, right)

    merge = (leftArray, rightArray) ->
        leftLength = leftArray.length
        rigthLength = rightArray.length
        orderedArray = []

        i = 0
        j = 0
        while i < leftLength or j < rigthLength
            if i == leftLength
                orderedArray.push(rightArray[j])
                j += 1
            else if j == rigthLength
                orderedArray.push(leftArray[i])
                i += 1
            else if leftArray[i] <= rightArray[j]
                orderedArray.push(leftArray[i])
                i += 1
            else if rightArray[j] < leftArray[i]
                orderedArray.push(rightArray[j])
                j += 1

        return orderedArray

    return divide(array)

@algCoffe = if @algCoffe then @algCoffe else {}
@algCoffe.mergeSort = mergeSort
