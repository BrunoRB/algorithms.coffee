### @author Tayllan Búrigo 2014 ###

binarySearch = (array, number) ->
    inferiorLimit = 0
    superiorLimit = array.length - 1

    while superiorLimit >= inferiorLimit
        half = parseInt((superiorLimit + inferiorLimit) / 2)

        if array[half] is number
            return half
        else if array[half] > number
            superiorLimit = half - 1
        else
            inferiorLimit = half + 1

    return -1

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.binarySearch = binarySearch
