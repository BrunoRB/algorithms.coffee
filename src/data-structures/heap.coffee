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
        @heapfy(pos, arrayLength, isGreaterThan, true)

    minHeapfy: (pos, arrayLength) ->
        isLessThan = (first, second) ->
            return first < second
        @heapfy(pos, arrayLength, isLessThan, false)

    insertIntoMaxHeap: (value) ->
        isLessThan = (first, second) ->
            return first < second
        @bubbleUp(@array.length - 1, isLessThan)

    insertIntoMinHeap: (value) ->
        isGreaterThan = (first, second) ->
            return first > second
        @bubbleUp(@array.length - 1, isGreaterThan)

    heapfy: (pos, arrayLength, compareFn, isMaxHeapfy) ->
        leftPos = 2 * pos + 1
        rightPos = 2 * (pos + 1)
        largestPos = pos

        if leftPos < arrayLength and compareFn(@array[leftPos], @array[largestPos])
            largestPos = leftPos

        if rightPos < arrayLength and compareFn(@array[rightPos], @array[largestPos])
            largestPos = rightPos

        if largestPos != pos
            [@array[pos], @array[largestPos]] = [@array[largestPos], @array[pos]]
            if isMaxHeapfy
                @maxHeapfy(largestPos, arrayLength)
            else
                @minHeapfy(largestPos, arrayLength)

    bubbleUp: (pos, compareFn) ->
        parentPos = (pos - 1) // 2
        if parentPos >= 0 and compareFn(@array[parentPos], @array[pos])
            [@array[pos], @array[parentPos]] = [@array[parentPos], @array[pos]]
            @bubbleUp(parentPos, compareFn)

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.Heap = Heap
