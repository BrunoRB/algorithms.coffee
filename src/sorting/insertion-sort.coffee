### @author Bruno Roberto Búrigo 2014 ###

insertionSort = (array) ->

    for i in [1...array.length] by 1
        aux = array[i]
        j = i

        while j > 0 and aux < array[j - 1]
            array[j] = array[j - 1]
            j -= 1

        array[j] = aux

    return array

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.insertionSort = insertionSort
