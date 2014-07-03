### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
longestCommonSubsequence = require('../../algorithms').longestCommonSubsequence

describe 'Longest Common Subsequence', ->

    describe 'Find the Longest Common Subsequence between two arrays', ->
        it 'should find the LCS between two arrays of Strings', ->
            firstSequence = 'thisisatest'.split ''
            secondSequence = 'testing123testing'.split ''
            subsequence = longestCommonSubsequence firstSequence, secondSequence, true
            correctAnswer = 'tsitest'

            assert.isString subsequence, 'The LCS is a String'
            assert.strictEqual subsequence, correctAnswer, 'The subsequences are the same'

        it 'should find the LCS between two arrays of Integers', ->
            firstSequence = '1224533324'.split ''
            secondSequence = '1234'.split ''
            subsequence = longestCommonSubsequence firstSequence, secondSequence, true
            correctAnswer = '1234'

            assert.isString subsequence, 'The LCS is a String'
            assert.strictEqual subsequence, correctAnswer, 'The subsequences are the same'

    describe 'Find the size of the LCS between two arrays', ->
        it 'should find the size of the LCS between two arrays of Strings', ->
            firstSequence = 'thisisatest'.split ''
            secondSequence = 'testing123testing'.split ''
            subsequenceSize = longestCommonSubsequence firstSequence, secondSequence
            correctSize = 7

            assert.isNumber subsequenceSize, 'The size of the LCS is a Number'
            assert.strictEqual subsequenceSize, correctSize, 'The answer is correct'

        it 'should find the size of the LCS between two arrays of Integers', ->
            firstSequence = '1224533324'.split ''
            secondSequence = '1234'.split ''
            subsequenceSize = longestCommonSubsequence firstSequence, secondSequence
            correctSize = 4

            assert.isNumber subsequenceSize, 'The size of the LCS is a Number'
            assert.strictEqual subsequenceSize, correctSize, 'The answer is correct'
