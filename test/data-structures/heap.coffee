
expect = require('chai').expect
Heap = require('../../algorithms').Heap

describe 'Heap', ->

    describe 'Create a Heap object', ->
        array = [10, 30, 40, 2]
        heap = new Heap(array)

        expect(heap).to.be.an.instanceof Heap
        expect(heap.array).to.be.an 'array'
        expect(heap.array).to.be.deep.equal array

    describe 'Heapfy', ->
        array = [3, 40, 20, 50, 1, 2, 444, 9, 50, 23, 132, 232, 134, 1, 455, 234, 1235, 9434, 4435, 22]
        heap = new Heap(array)

        it 'should build a max heap, so the parent value is always greater than his children values', ->
            heap.buildMaxHeap()

            for index in [0...array.length]
                leftChild = 2 * index + 1
                rightChild = 2 * (index + 1)

                if leftChild < array.length
                    expect(array[index]).to.be.at.least(array[leftChild])
                if rightChild < array.length
                    expect(array[index]).to.be.at.least(array[rightChild])

        it 'should build a min heap, so the parent value is always smaller than his children values', ->
            heap.buildMinHeap()

            for index in [0...array.length]
                leftChild = 2 * index + 1
                rightChild = 2 * (index + 1)

                if leftChild < array.length
                    expect(array[index]).to.be.at.most(array[leftChild])
                if rightChild < array.length
                    expect(array[index]).to.be.at.most(array[rightChild])

    describe 'Insert', ->
        array = [3, 40, 20, 50, 1, 2, 444, 9, 50, 23, 132, 232, 134, 1, 455, 234, 1235, 9434, 4435, 22]
        heap = new Heap(array)

        it 'should properly insert values in a maxHeap', ->
            heap.buildMaxHeap(array)
            heap.insertIntoMaxHeap(30)
            heap.insertIntoMaxHeap(13)
            heap.insertIntoMaxHeap(9999)
            heap.insertIntoMaxHeap(-1)

            for index in [0...array.length]
                leftChild = 2 * index + 1
                rightChild = 2 * (index + 1)

                if leftChild < array.length
                    expect(array[index]).to.be.at.least(array[leftChild])
                if rightChild < array.length
                    expect(array[index]).to.be.at.least(array[rightChild])

        it 'should properly insert values in a minHeap', ->
            heap.buildMinHeap(array)
            heap.insertIntoMinHeap(30)
            heap.insertIntoMinHeap(13)
            heap.insertIntoMinHeap(9999)
            heap.insertIntoMinHeap(-1)

            for index in [0...array.length]
                leftChild = 2 * index + 1
                rightChild = 2 * (index + 1)

                if leftChild < array.length
                    expect(array[index]).to.be.at.most(array[leftChild])
                if rightChild < array.length
                    expect(array[index]).to.be.at.most(array[rightChild])
