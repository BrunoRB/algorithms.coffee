### @author Bruno Roberto Búrigo 2014 ###

class Heap

    constructor: (array = []) ->
        @array = array

    buildMaxHeap: () ->
        arrayLength = @array.length
        start = arrayLength // 2
        for i in [start..0] by -1
            @maxHeapfy(i, arrayLength)

    buildMinHeap: () ->
        arrayLength = @array.length
        start = arrayLength // 2
        for i in [start..0] by -1
            @minHeapfy(i, arrayLength)

    maxHeapfy: (pos, arrayLength) ->
        isGreaterThan = (first, second) ->
            return first > second
        @heapfy(pos, arrayLength, isGreaterThan)

    minHeapfy: (pos, arrayLength) ->
        isLessThan = (first, second) ->
            return first < second
        @heapfy(pos, arrayLength, isLessThan)

    heapfy: (pos, arrayLength, compare) ->
        leftPos = 2 * pos + 1
        rightPos = 2 * (pos + 1)
        largestPos = pos

        if leftPos < arrayLength and compare(@array[leftPos], @array[largestPos])
            largestPos = leftPos

        if rightPos < arrayLength and compare(@array[rightPos], @array[largestPos])
            largestPos = rightPos

        if largestPos != pos
            [@array[pos], @array[largestPos]] = [@array[largestPos], @array[pos]]
            @maxHeapfy(largestPos, arrayLength)

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.Heap = Heap
