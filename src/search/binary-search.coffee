### @author Tayllan Búrigo 2014 ###

if typeof module isnt 'undefined'
    Comparator = require('./../util/comparator').algCoffee.Comparator
else
    Comparator = algCoffee.Comparator

binarySearch = (array, number, compareFn) ->
    inferiorLimit = 0
    superiorLimit = array.length - 1
    comparator = new Comparator(compareFn)

    while superiorLimit >= inferiorLimit
        half = parseInt((superiorLimit + inferiorLimit) / 2)

        if comparator.equal(array[half], number)
            return half
        else if comparator.greaterThan(array[half], number)
            superiorLimit = half - 1
        else
            inferiorLimit = half + 1

    return -1

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.binarySearch = binarySearch
