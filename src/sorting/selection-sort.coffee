### @author Bruno Roberto Búrigo 2014 ###

if typeof module isnt 'undefined'
    Comparator = require('./../util/comparator').algCoffee.Comparator
else
    Comparator = algCoffee.Comparator

selectionSort = (array, compareFn) ->
    comparator = new Comparator(compareFn)
    length = array.length

    findSmallestElementIndex = (startIndex) ->
        smallestElement = array[startIndex]
        smallestElementIndex = startIndex
        startIndex += 1

        for i in [startIndex...length] by 1
            if comparator.lesserThan(array[i], smallestElement)
                smallestElement = array[i]
                smallestElementIndex = i

        return smallestElementIndex

    for i in [0...length] by 1
        smallestElementIndex = findSmallestElementIndex(i)

        [array[i], array[smallestElementIndex]] = [array[smallestElementIndex], array[i]]

    return array

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.selectionSort = selectionSort
