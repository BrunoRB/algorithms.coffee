### @author Tayllan Búrigo 2014 ###

expect = require('chai').expect
reservoirSampling = require('../../algorithms').reservoirSampling

describe 'Reservoir Sampling', ->

    describe 'Creates a new array with K elements from the original one', ->
        it 'should create a new sample array from the original array', ->
            array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
            reservoir = reservoirSampling array, 5

            for element in reservoir
                index = array.indexOf element

                expect(index).to.be.above -1

            expect(array).to.include.members reservoir
