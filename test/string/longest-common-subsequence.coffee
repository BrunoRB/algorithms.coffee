### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
lcs = require('../../algorithms').lcs

# examples taken from http://rosettacode.org/wiki/Longest_common_subsequence
describe 'Longest Common Subsequence', ->

    describe 'Find the Longest Common Subsequence between two arrays', ->
        it 'should find the LCS between two arrays of Strings', ->
            firstSequence = 'thisisatest'.split('')
            secondSequence = 'testing123testing'.split('')
            subsequence = lcs(firstSequence, secondSequence, true)
            correctAnswer = 'tsitest'.split('')

            assert.isArray(subsequence, 'The LCS is in an Array')

            subsequenceLength = subsequence.length

            for i in [0...subsequenceLength] by 1
                assert.strictEqual(subsequence[i], correctAnswer[i], 'The letters are equal')

        it 'should find the LCS between two arrays of Integers', ->
            firstSequence = '1224533324'.split('')
            secondSequence = '1234'.split('')
            subsequence = lcs(firstSequence, secondSequence, true)
            correctAnswer = '1234'.split('')

            assert.isArray(subsequence, 'The LCS is in an Array')

            subsequenceLength = subsequence.length

            for i in [0...subsequenceLength] by 1
                assert.strictEqual(subsequence[i], correctAnswer[i], 'The letters are equal')

    describe 'Find the size of the LCS between two arrays', ->
        it 'should find the size of the LCS between two arrays of Strings', ->
            firstSequence = 'thisisatest'.split('')
            secondSequence = 'testing123testing'.split('')
            subsequenceSize = lcs(firstSequence, secondSequence)
            correctSize = 7

            assert.isArray(subsequenceSize, 'The size of the LCS is also in an Array')
            assert.strictEqual(subsequenceSize[0], correctSize, 'The answer is correct')

        it 'should find the size of the LCS between two arrays of Integers', ->
            firstSequence = '1224533324'.split('')
            secondSequence = '1234'.split('')
            subsequenceSize = lcs(firstSequence, secondSequence)
            correctSize = 4

            assert.isArray(subsequenceSize, 'The size of the LCS is also in an Array')
            assert.strictEqual(subsequenceSize[0], correctSize, 'The answer is correct')
