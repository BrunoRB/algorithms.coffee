### @author Bruno Roberto Búrigo 2014 ###

radixSort = (array) ->
    maxValue = array[0]

    # first we get the array max value
    for value in array
        if value > maxValue
            maxValue = value

    # then we get the maximum number of digits of maxValue
    maxNumberOfDigits = 0
    while maxValue != 0
        maxNumberOfDigits += 1
        maxValue = maxValue // 10

    # the, sort !
    dividedBy = 1
    for x in [0...maxNumberOfDigits]
        auxArray = ([] for l in [0...10])

        for value in array
            dividedValue = value // dividedBy
            digit = dividedValue % 10
            auxArray[digit].push(value)

        index = 0
        for list in auxArray
            for value in list
                array[index] = value
                index += 1

        dividedBy *= 10

    return array

try
    module.exports = radixSort
catch exception
    window.algCoffe =  if window.algCoffe then window.algCoffe else {}
    window.algCoffe.radixSort = radixSort
