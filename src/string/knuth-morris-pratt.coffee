### @author Tayllan Búrigo 2014 ###

###
    @param {Array} text of Numbers, Strings or Characters
        or {String}
    @param {Array} pattern of Numbers, Strings or Characters
        or {String}
    @return {Number} the position where the pattern begins in the text
        or the length of the text if the pattern doesn't exist in the text
###
knuthMorrisPratt = (text, pattern) ->
    buildTable = () ->
        pos = 2
        cnd = 0
        table = []

        table.push(-1)
        table.push(0)

        for i in [2...patternLength] by 1
            table.push(0)

        while pos < patternLength
            if pattern[pos - 1] is pattern[cnd]
                cnd += 1
                table[pos] = cnd
                pos += 1
            else if cnd > 0
                cnd = table[cnd]
            else
                table[pos] = 0
                pos += 1

        return table

    textLength = text.length
    patternLength = pattern.length
    m = 0
    i = 0
    table = buildTable()

    while m + i < textLength
        if pattern[i] is text[m + i]
            if i is patternLength - 1
                return m
            i += 1
        else
            if table[i] >= 0
                i = table[i]
                m = m + i - table[i]
            else
                i = 0
                m += 1

    return textLength

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.knuthMorrisPratt = knuthMorrisPratt
