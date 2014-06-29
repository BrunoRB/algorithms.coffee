### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
karatsubaMultiplication = require('../../algorithms').karatsubaMultiplication

describe 'Karatsuba Multiplication', ->

    describe 'Karatusuba Multiplication for large numbers', ->
        it 'should multiply two numbers', ->
            assert.strictEqual(karatsubaMultiplication(123456, 98765432), 12193185172992, 'Multiplying two numbers')
            assert.strictEqual(karatsubaMultiplication(3, 13), 39, 'Another multiplication')
            assert.strictEqual(karatsubaMultiplication(0, 0), 0, 'And another multiplication')
