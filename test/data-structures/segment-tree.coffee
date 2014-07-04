### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
SegmentTree = require('../../algorithms').SegmentTree

describe 'Segment Tree', ->

    describe 'Store elements if the form of segments and perform Sum operations over the segments', ->
        arrayOfElements = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        arrayLength  = arrayOfElements.length

        segmentTree = new SegmentTree arrayOfElements, 0, arrayLength - 1, (a, b) -> return a + b

        it 'should assert that the Segment Tree was created with the given values', ->
            for index in [0...arrayLength] by 1
                assert.strictEqual arrayOfElements[index], segmentTree.query(index, index), 'The value is correct'

        it 'should update the values in the SegmentTree and assert the @total value', ->
            # [0, 0, 0, 0, 0, 18, 0, 0, 0, 0] = query(3, 5) is 18
            segmentTree.update 5, 18
            assert.strictEqual segmentTree.query(3, 5), 18, 'Correct'

            # [0, 0, 0, 0, 0, 18, 0, 0, 0, 999] = query(0, 9) is 1017
            segmentTree.update 9, 999
            assert.strictEqual segmentTree.query(0, 9), 1017, 'Correct'

            # [0, 0, 2, 0, 0, 18, 0, 0, 0, 999] = query(5, 9) is 1017 and query(0, 2) is 2
            segmentTree.update 2, 2
            assert.strictEqual segmentTree.query(5, 9), 1017, 'Correct'
            assert.strictEqual segmentTree.query(0, 2), 2, 'Correct'

            # [0, 0, 2, 0, 0, 18, 0, 0, 0, 1] = query(9, 9) is 1 and query(6, 8) is 0
            segmentTree.update 9, 1
            assert.strictEqual segmentTree.query(9, 9), 1, 'Correct'
            assert.strictEqual segmentTree.query(6, 8), 0, 'Correct'

    describe 'Store elements if the form of segments and perform Multiplication operations over the segments', ->
        arrayOfElements = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        arrayLength  = arrayOfElements.length

        segmentTree = new SegmentTree arrayOfElements, 0, arrayLength - 1, (a, b) -> return a * b

        it 'should assert that the Segment Tree was created with the given values', ->
            for index in [0...arrayLength] by 1
                assert.strictEqual arrayOfElements[index], segmentTree.query(index, index), 'The value is correct'

        it 'should update the values in the SegmentTree and assert the @total value', ->
            # [1, 1, 1, 1, 1, 18, 1, 1, 1, 1] = query(3, 5) is 18
            segmentTree.update 5, 18
            assert.strictEqual segmentTree.query(3, 5), 18, 'Correct'

            # [1, 1, 1, 1, 1, 18, 1, 1, 1, 999] = query(0, 9) is 17982
            segmentTree.update 9, 999
            assert.strictEqual segmentTree.query(0, 9), 17982, 'Correct'

            # [1, 1, 2, 1, 1, 18, 1, 1, 1, 999] = query(5, 9) is 1017 and query(0, 2) is 2
            segmentTree.update 2, 2
            assert.strictEqual segmentTree.query(5, 9), 17982, 'Correct'
            assert.strictEqual segmentTree.query(0, 2), 2, 'Correct'

            # [1, 1, 2, 1, 1, 18, 1, 1, 1, 1] = query(9, 9) is 1 and query(6, 8) is 1
            segmentTree.update 9, 1
            assert.strictEqual segmentTree.query(9, 9), 1, 'Correct'
            assert.strictEqual segmentTree.query(6, 8), 1, 'Correct'
