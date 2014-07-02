### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
DisjointSet = require('../../algorithms').DisjointSet

describe 'Disjoint Set', ->

    describe 'Disjoint Set Data Structure to support the operations Find and Union', ->
        it 'should unite sets and find the root for each one of them', ->
            arrayOfKeys = ['A', 'B', 'C', 'D', 'E', 'F']
            set = new DisjointSet arrayOfKeys

            for key in arrayOfKeys
                assert.strictEqual key, set.find(key), 'Initially every element is it\'s own root'

            set.union 'A', 'B'
            set.union 'C', 'F'

            assert.strictEqual set.find('A'), set.find('B'), 'The root for A and B is the same'
            assert.strictEqual set.find('F'), set.find('C'), 'The root for C and F is the same'
            assert.notStrictEqual set.find('E'), set.find('A'), 'A and E are not in the same set'

            set.union 'B', 'C'

            assert.strictEqual set.find('B'), set.find('C'), 'Now B and C are in the same set'
