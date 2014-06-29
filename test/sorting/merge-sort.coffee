
expect = require('chai').expect
mergeSort = require('../../algorithms').mergeSort

describe 'Merge Sort', ->

    describe 'Sort an array of integers ', ->
        it 'should order an array correctly', ->
            unsortedArray = [1001, 3, 330, 7, 656, 700, 656, 932, 2]
            sortedArray = [2, 3, 7, 330, 656, 656, 700, 932, 1001]

            expect(mergeSort(unsortedArray)).to.be.deep.equal(sortedArray);
