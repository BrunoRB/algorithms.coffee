### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
binarySearch = require('../../algorithms').binarySearch

describe 'Binary Search', ->

    describe 'Search for a value inside a Ordered Array of Numbers', ->
        it 'should search for a value inside a Ordered Array and return the position of the value or -1', ->
            array = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

            assert.strictEqual binarySearch(array, 0), 0,
            assert.strictEqual binarySearch(array, 1), 2, 'The first ONE found'
            assert.strictEqual binarySearch(array, 1), 2, 'The first ONE found'
            assert.strictEqual binarySearch(array, 2), 3,
            assert.strictEqual binarySearch(array, 3), 4,
            assert.strictEqual binarySearch(array, 5), 5,
            assert.strictEqual binarySearch(array, 8), 6,
            assert.strictEqual binarySearch(array, 13), 7,
            assert.strictEqual binarySearch(array, 21), 8,
            assert.strictEqual binarySearch(array, 34), 9,
            assert.strictEqual binarySearch(array, 55), 10,
            assert.strictEqual binarySearch(array, 89), 11,

            assert.strictEqual binarySearch(array, 22), -1, 'This value doesn\'t exist on the array'
            assert.strictEqual binarySearch(array, -2), -1, 'This value doesn\'t exist on the array'
            assert.strictEqual binarySearch(array, 90), -1, 'This value doesn\'t exist on the array'
            assert.strictEqual binarySearch(array, 4), -1, 'This value doesn\'t exist on the array'
            assert.strictEqual binarySearch(array, 54), -1, 'This value doesn\'t exist on the array'

    describe 'Search for a value inside an Array of Objects', ->
        it 'should search for a value inside an Array of Objects with a Custom Compartor', ->
            array = [
                'a',
                'ab',
                'abc',
                'abcd',
                'abcde'
            ]
            compareFn = (a, b) ->
                if a.length is b.length
                    return 0
                else if a.length < b.length
                    return -1
                else
                    return 1

            # the only property considered in the search is the length of the word
            assert.strictEqual binarySearch(array, '1', compareFn), 0, 'A word of length 1'
            assert.strictEqual binarySearch(array, '22', compareFn), 1, 'A word of length 2'
            assert.strictEqual binarySearch(array, '333', compareFn), 2, 'A word of length 3'
            assert.strictEqual binarySearch(array, '4444', compareFn), 3, 'A word of length 4'
            assert.strictEqual binarySearch(array, '55555', compareFn), 4, 'A word of length 5'

            assert.strictEqual binarySearch(array, {length: 7}, compareFn), -1,
                'There is no word of length 7 in the array'
