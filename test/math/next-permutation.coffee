### @author Tayllan Búrigo 2014 ###

expect = require('chai').expect
nextPermutation = require('../../algorithms').nextPermutation

describe 'Next Permutation', ->

    describe 'Calculates the next permutation in lexicographical order of an array', ->
        it 'should assert the permutation of an array of letters', ->
            array = ['a', 'b', 'c']
            correctAnswer = [
                ['a', 'b', 'c'],
                ['a', 'c', 'b'],
                ['b', 'a', 'c'],
                ['b', 'c', 'a'],
                ['c', 'a', 'b'],
                ['c', 'b', 'a'],

                # when it receives the last permutation of an array
                # the function simply returns the array unaltered
                ['c', 'b', 'a']
            ]

            for i in [0...7] by 1
                expect(array).to.eql correctAnswer[i]
                array = nextPermutation array

        it 'should assert the permutation of an array of numbers', ->
            array = [1, 3, 2]
            correctAnswer = [

                # the array started in a later permutation
                [1, 3, 2],
                [2, 1, 3],
                [2, 3, 1],
                [3, 1, 2],
                [3, 2, 1],
            ]

            for i in [0...5] by 1
                expect(array).to.eql correctAnswer[i]
                array = nextPermutation array
