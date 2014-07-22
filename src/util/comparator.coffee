### @author Tayllan Búrigo 2014 ###

class Comparator
    constructor: (compareFn) ->
        if compareFn isnt undefined
            @compare = compareFn

    # default comparator function
    compare: (a, b) ->
        if a is b
            return 0
        else if a < b
            return -1
        else
            return 1

    equal: (a, b) ->
        return @compare(a, b) is 0

    lesserThan: (a, b) ->
        return @compare(a, b) < 0

    lesserThanOrEqual: (a, b) ->
        return @lesserThan(a, b) or @equal(a, b)

    greaterThan: (a, b) ->
        return @compare(a, b) > 0

    greaterThanOrEqual: (a, b) ->
        return @greaterThan(a, b) or @equal(a, b)


@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.Comparator = Comparator
