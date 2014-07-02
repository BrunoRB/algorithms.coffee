### @author Tayllan Búrigo 2014 ###

class DisjointSet
    constructor: (arrayOfKeys = []) ->
        @parents = {}
        @ranks = {}

        for key in arrayOfKeys
            @parents[key] = key
            @ranks[key] = 0

    find: (key) ->
        if @parents[key] isnt key
            @parents[key] = @find(@parents[key])

        return @parents[key]

    union: (x, y) ->
        xRoot = @find(x)
        yRoot = @find(y)

        if xRoot isnt yRoot
            if @ranks[xRoot] < @ranks[yRoot]
                @parents[xRoot] = yRoot
            else if @ranks[xRoot] > @ranks[yRoot]
                @parents[yRoot] = xRoot
            else
                @parents[yRoot] = xRoot
                @ranks[xRoot] += 1

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.DisjointSet = DisjointSet
