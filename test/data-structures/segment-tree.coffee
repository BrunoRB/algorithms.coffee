### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
SegmentTree = require('../../algorithms').SegmentTree

describe 'Segment Tree', ->

    describe 'Store elements if the form of segments and perform Sum operations over the segments', ->
        arrayOfElements = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        arrayLength  = arrayOfElements.length

        segmentTree = new SegmentTree arrayOfElements, 0, arrayLength - 1, (a, b) -> return a + b

        # sum all elements
        auxiliaryFunction = (i, j) ->
            total = 0

            for index in [i..j] by 1
                total += arrayOfElements[index]

            return total

        it 'should assert that the Segment Tree was created with the given values', ->
            for index in [0...arrayLength] by 1
                assert.strictEqual arrayOfElements[index], segmentTree.query(index, index), 'The value is correct'

        it 'should update the values in the SegmentTree and assert the @total value', ->

            # each element will be updated once
            for index in [0...arrayLength] by 1
                newValue = parseInt Math.random() * 1000
                segmentTree.update index, newValue

                # and just for test purposes, the array is also updated
                arrayOfElements[index] = newValue

                # indices to update
                indexA = parseInt Math.random() * (arrayLength - 1)
                indexB = parseInt Math.random() * (arrayLength - 1)

                if indexA > indexB
                    [indexA, indexB] = [indexB, indexA]

                correctAnswer = auxiliaryFunction indexA, indexB
                givenAnswer = segmentTree.query indexA, indexB

                assert.strictEqual correctAnswer, givenAnswer, 'The operation was performed successfully'

    describe 'Store elements if the form of segments and perform Multiplication operations over the segments', ->
        arrayOfElements = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        arrayLength  = arrayOfElements.length

        segmentTree = new SegmentTree arrayOfElements, 0, arrayLength - 1, (a, b) -> return a * b

        # multiply all elements
        auxiliaryFunction = (i, j) ->
            total = 1

            for index in [i..j] by 1
                total *= arrayOfElements[index]

            return total

        it 'should assert that the Segment Tree was created with the given values', ->
            for index in [0...arrayLength] by 1
                assert.strictEqual arrayOfElements[index], segmentTree.query(index, index), 'The value is correct'

        it 'should update the values in the SegmentTree and assert the @total value', ->

            # each element will be updated once
            for index in [0...arrayLength] by 1
                newValue = parseInt Math.random() * 1000
                segmentTree.update index, newValue

                # and just for test purposes, the array is also updated
                arrayOfElements[index] = newValue

                # indices to update
                indexA = parseInt Math.random() * (arrayLength - 1)
                indexB = parseInt Math.random() * (arrayLength - 1)

                if indexA > indexB
                    [indexA, indexB] = [indexB, indexA]

                correctAnswer = auxiliaryFunction indexA, indexB
                givenAnswer = segmentTree.query indexA, indexB

                assert.strictEqual correctAnswer, givenAnswer, 'The operation was performed successfully'
