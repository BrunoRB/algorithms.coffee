### @author Tayllan Búrigo 2014 ###

###
    @param{Object} the first cartesian point, with the X and Y properties
    @param{Object} the second cartesian point, with the X and Y properties
    @return{Number} the Euclidean Distance between the given points
###
euclideanDistance = (pointA, pointB) ->
    if pointA isnt undefined and pointB isnt undefined
        if pointA.x is undefined or pointA.y is undefined or pointB.x is undefined or pointB.y is undefined
            return undefined
        else
            xSquared = (pointB.x - pointA.x) * (pointB.x - pointA.x)
            ySquared = (pointB.y - pointA.y) * (pointB.y - pointA.y)

            return Math.sqrt(xSquared + ySquared)
    else
        return undefined

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.euclideanDistance = euclideanDistance
