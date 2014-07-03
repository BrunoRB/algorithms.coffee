### @author Tayllan Búrigo 2014 ###

class SegmentTree

    # leftLimit and rightLimit determine the elements from the array that will be used to form de Segment Tree
    # @operation is a function which operates over two variables. It will be used to get the @total of the Segemet Tree
    constructor: (arrayOfElements = [], leftLimit, rightLimit, @operation) ->
        @leftIndex = leftLimit
        @rightIndex = rightLimit

        if leftLimit is rightLimit
            @leftNode = null
            @rightNode = null
            @total = arrayOfElements[leftLimit]
        else
            halfLimit = parseInt((leftLimit + rightLimit) / 2)
            @leftNode = new SegmentTree(arrayOfElements, leftLimit, halfLimit, @operation)
            @rightNode = new SegmentTree(arrayOfElements, halfLimit + 1, rightLimit, @operation)
            @total = @operation(@leftNode.total, @rightNode.total)

    query: (i, j) ->
        if j < @leftIndex or @rightIndex < i
            return undefined
        else if i <= @leftIndex and @rightIndex <= j
            return @total
        else
            leftTotal = @leftNode.query(i, j)
            rightTotal = @rightNode.query(i, j)

            if leftTotal is undefined and rightTotal is undefined
                return undefined
            else if leftTotal is undefined
                return rightTotal
            else if rightTotal is undefined
                return leftTotal
            else
                return @operation(leftTotal, rightTotal)

    update: (index, newValue) ->
        if index < @leftIndex or @rightIndex < index
            return @total
        else if index <= @leftIndex and @rightIndex <= index
            @total = newValue
            return @total
        else
            @total = @operation(@leftNode.update(index, newValue), @rightNode.update(index, newValue))
            return @total

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.SegmentTree = SegmentTree
