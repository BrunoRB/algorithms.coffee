### @author Tayllan Búrigo 2014 ###

expect = require('chai').expect
knuthShuffle = require('../../algorithms').knuthShuffle

describe 'Knuth Shuffle', ->

    describe 'Shuffle an array of elements', ->
        it 'should shuffle an array (get a random permutation of it)', ->
            array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
            shuffledArray = knuthShuffle array

            for element in shuffledArray
                index = array.indexOf element

                expect(index).to.be.above -1

            expect(array).to.have.members shuffledArray
