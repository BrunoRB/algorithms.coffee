expect = require('chai').expect
karpRabin = require('../../algorithms').karpRabin

describe 'Karp-Rabin', ->

    describe 'Find a pattern in a string', ->
        str = 'Cthulhu'

        it 'should return true', ->
            pattern = 'Cthulhu'
            expect(karpRabin(str, pattern)).to.be.equal(true)

        it 'should return true', ->
            pattern = 'th'
            expect(karpRabin(str, pattern)).to.be.equal(true)

        it 'should return true', ->
            pattern = 'hu'
            expect(karpRabin(str, pattern)).to.be.equal(true)

        it 'should return true', ->
            pattern = 'Cthu'
            expect(karpRabin(str, pattern)).to.be.equal(true)

        it 'should return false', ->
            pattern = 'uh'
            expect(karpRabin(str, pattern)).to.be.equal(false)

        it 'should return false', ->
            pattern = 'Cthelhu'
            expect(karpRabin(str, pattern)).to.be.equal(false)

        it 'should return false', ->
            pattern = 'Cthulho'
            expect(karpRabin(str, pattern)).to.be.equal(false)

        it 'should return false', ->
            pattern = 'Dthulhu'
            expect(karpRabin(str, pattern)).to.be.equal(false)
