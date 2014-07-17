### @author Bruno Roberto Búrigo 2014 ###

karpRabin = (string, pattern) ->
    base = 997 # large prime. TODO, this should be dynamic

    equalStr = (strOne, strTwo) ->
        for i in [0...strOne.length] by 1
            if strOne[i] != strTwo[i]
                return false
        return true

    hash = (str, startIndex, endIndex, hash = 0) ->
        subStrLength = endIndex - startIndex
        if hash == 0
            for i in [startIndex...endIndex] by 1
                hash += str.charCodeAt(i) * Math.pow(base, subStrLength - i - 1)
        else
            hash -= str.charCodeAt(startIndex - 1) * Math.pow(base, subStrLength - 1)
            hash *= base
            hash += str.charCodeAt(endIndex - 1)

        return hash

    patternHash = hash(pattern, 0, pattern.length)
    substringHash = 0
    for i in [0...(string.length - pattern.length + 1)] by 1
        substringHash = hash(string, i, pattern.length + i, substringHash)
        if substringHash == patternHash
            j = i + pattern.length
            if equalStr(pattern, string[i...j])
                return true
    return false

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.karpRabin = karpRabin
