### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
euclideanDistance = require('../../algorithms').euclideanDistance

describe 'Euclidean Distance', ->

    describe 'Calculates the Euclidean Distance between two Cartesian Points', ->
        it 'should calculate the Euclidean Distance between two given points', ->
            pointA =
                x: 43.3
                y: 12

            pointB =
                x: 58
                y: 12.1

            assert.strictEqual euclideanDistance(pointA, pointB), 14.700340132119395,
                'The distance between points A and B'

            pointA =
                x: 1
                y: 1

            pointB =
                x: 1
                y: 1

            assert.strictEqual euclideanDistance(pointA, pointB), 0,
                'The distance between points A and B'

            # no Y property
            pointA =
                x: 43.3

            assert.isUndefined euclideanDistance(pointA, pointB), 'The algorithm can\'t be executed'

            # no coordinates at all
            pointA =
                irrelevantProperty: 'Irrelevant Value'

            assert.isUndefined euclideanDistance(pointA, pointB), 'The algorithm can\'t be executed'
