### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
editDistance = require('../../algorithms').editDistance

describe 'Edit Distance', ->

    describe 'Calculates the number of operations needed to transform one String into another', ->
        it 'should perform the Edit Distance with the three basic operations (insertion, deletion and substitution)', ->
            A = 'caalfqjmdcjpr'
            B = 'qrlvbqhprflfruqdcz'
            C = 'gjfyngmekkeifuirqktujhggfq'
            D = 'okqbio'
            E = 'hdleleutnltmnd'
            F = 'qnlgryucvoghvwvjhabaasfdadsfa'

            assert.strictEqual editDistance(A, B), 16, 'The needed amount of operations to transform A into B'
            assert.strictEqual editDistance(B, A), 16, 'The needed amount of operations to transform B into A'

            assert.strictEqual editDistance(A, C), 24, 'The needed amount of operations to transform A into C'
            assert.strictEqual editDistance(C, A), 24, 'The needed amount of operations to transform C into A'

            assert.strictEqual editDistance(A, D), 12, 'The needed amount of operations to transform A into D'
            assert.strictEqual editDistance(A, E), 13, 'The needed amount of operations to transform A into E'

            assert.strictEqual editDistance(A, F), 26, 'The needed amount of operations to transform A into F'
            assert.strictEqual editDistance(F, A), 26, 'The needed amount of operations to transform F into A'
