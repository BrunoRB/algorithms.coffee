### @author Tayllan Búrigo 2014 ###

reservoirSampling = (array, lengthOfSample) ->
    length = array.length

    if lengthOfSample > length
        lengthOfSample = length

    reservoir = array[0...lengthOfSample]

    for i in [0...lengthOfSample] by 1
        reservoir[i] = array[i]

    for i in [lengthOfSample + 1...length] by 1
        j = Math.floor(Math.random() * (i + 1))
        if j < lengthOfSample
            reservoir[j] = array[i]

    return reservoir

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.reservoirSampling = reservoirSampling
