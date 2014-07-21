### @author Tayllan Búrigo 2014 ###

nextPermutation = (array) ->
    k = -1
    length = array.length

    for i in [0...length - 1] by 1
        if array[i] < array[i + 1] and i > k
            k = i

    # array contains the last permutation of the elements
    if k is -1
        return array
    else
        l = k + 1
        for i in [l...length] by 1
            if array[i] > array[k]
                l = i

        [array[k], array[l]] = [array[l], array[k]]

        tempArray = array[k + 1...length]
        index = length - 1

        for element in tempArray
            array[index] = element
            index -= 1

        return array

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.nextPermutation = nextPermutation
