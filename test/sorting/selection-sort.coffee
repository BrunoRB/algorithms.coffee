### @author Tayllan Búrigo 2014 ###

expect = require('chai').expect
selectionSort = require('../../algorithms').selectionSort

describe 'Selection Sort', ->

    describe 'Sort an array of Integers', ->
        it 'should order an array correctly', ->
            unsortedArray = [1001, 3, 330, 7, 656, 700, 656, 932, 2]
            sortedArray = [2, 3, 7, 330, 656, 656, 700, 932, 1001]

            expect(selectionSort(unsortedArray)).to.be.deep.equal sortedArray

    describe 'Sort an array of Objects', ->
        it 'should order an array correctly', ->

            # the only attribute that matters is the LENGTH of the String
            compareFn = (a, b) ->
                if a.length is b.length
                    return 0
                else if a.length < b.length
                    return -1
                else
                    return 1

            unsortedArray = ['b', 'ccccc', 'a', 'aa', 'the', 'tha', 'dddddd']
            sortedArray = ['b', 'a', 'aa', 'the', 'tha', 'ccccc', 'dddddd']

            expect(selectionSort(unsortedArray, compareFn)).to.be.deep.equal sortedArray
