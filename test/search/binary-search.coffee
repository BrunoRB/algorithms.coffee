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
