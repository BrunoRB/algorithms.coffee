### @author Tayllan Búrigo 2014 ###

knuthShuffle = (array) ->
    length = array.length

    for i in [0...length] by 1
        j = Math.floor(Math.random() * (i + 1))
        [array[i], array[j]] = [array[j], array[i]]

    return array

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.knuthShuffle = knuthShuffle
