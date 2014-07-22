### @author Tayllan Búrigo 2014 ###

expect = require('chai').expect
Comparator = require('../../algorithms').Comparator

describe 'Comparator', ->

    describe 'Comparator Function', ->
        it 'should test the Default Comparator Function', ->
            defaultComparator = new Comparator

            expect(defaultComparator.compare(6, 6)).to.equal 0
            expect(defaultComparator.compare(6, 7)).to.equal -1
            expect(defaultComparator.compare(9, 1)).to.equal 1
            expect(defaultComparator.compare('t', 'b')).to.equal 1

            expect(defaultComparator.equal(0, 0)).to.be.true
            expect(defaultComparator.equal(0, 1)).to.not.be.true

            expect(defaultComparator.lesserThan(0, 1)).to.be.true
            expect(defaultComparator.lesserThan(0, 0)).to.not.be.true
            expect(defaultComparator.lesserThan(1, 0)).to.not.be.true

            expect(defaultComparator.lesserThanOrEqual(1, 1)).to.be.true
            expect(defaultComparator.lesserThanOrEqual(0, 1)).to.be.true
            expect(defaultComparator.lesserThanOrEqual(1, 0)).to.not.be.true

            expect(defaultComparator.greaterThan(1, 0)).to.be.true
            expect(defaultComparator.greaterThan(1, 1)).to.not.be.true
            expect(defaultComparator.greaterThan(0, 1)).to.not.be.true

            expect(defaultComparator.greaterThanOrEqual(1, 1)).to.be.true
            expect(defaultComparator.greaterThanOrEqual(1, 0)).to.be.true
            expect(defaultComparator.greaterThanOrEqual(0, 1)).to.not.be.true

        it 'should test a Custom Comparator Function', ->
            compareFn = (a, b) ->
                if a.key is b.key
                    return 0
                else if a.key < b.key
                    return -1
                else
                    return 1

            customComparator = new Comparator compareFn
            one =
                key: 1
            zero =
                key: 0

            expect(customComparator.compare(one, one)).to.equal 0
            expect(customComparator.compare(zero, one)).to.equal -1
            expect(customComparator.compare(one, zero)).to.equal 1

            expect(customComparator.equal(zero, zero)).to.be.true
            expect(customComparator.equal(zero, one)).to.not.be.true

            expect(customComparator.greaterThan(one, zero)).to.be.true
            expect(customComparator.greaterThan(one, one)).to.not.be.true
            expect(customComparator.greaterThan(zero, one)).to.not.be.true

            expect(customComparator.lesserThan(zero, one)).to.be.true
            expect(customComparator.lesserThan(zero, zero)).to.not.be.true
            expect(customComparator.lesserThan(one, zero)).to.not.be.true

            expect(customComparator.lesserThanOrEqual(one, one)).to.be.true
            expect(customComparator.lesserThanOrEqual(zero, one)).to.be.true
            expect(customComparator.lesserThanOrEqual(one, zero)).to.not.be.true

            expect(customComparator.greaterThanOrEqual(one, one)).to.be.true
            expect(customComparator.greaterThanOrEqual(one, zero)).to.be.true
            expect(customComparator.greaterThanOrEqual(zero, one)).to.not.be.true
