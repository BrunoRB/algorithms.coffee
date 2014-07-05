### @author Bruno Roberto Búrigo 2014 ###

if typeof module isnt 'undefined'
    Heap = require('./../data-structures/heap').algCoffee.Heap
else
    Heap = algCoffee.Heap

heapSort = (array) ->
    heap = new Heap(array)
    heap.buildMaxHeap()

    length = array.length

    while length > 0
        length -= 1
        [array[0], array[length]] = [array[length], array[0]]
        heap.maxHeapfy(0, length)

    return array

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.heapSort = heapSort
