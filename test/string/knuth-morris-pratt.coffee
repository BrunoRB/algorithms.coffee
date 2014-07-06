### @author Tayllan Búrigo 2014 ###

assert = require('chai').assert
knuthMorrisPratt = require('../../algorithms').knuthMorrisPratt

describe 'Knuth–Morris–Pratt', ->

    describe 'Tries to match a given Pattern in a Text', ->
        it 'should verify if a pattern is contained in some text (or array)', ->
            text = 'A string matching algorithm wants to find the starting' +
                'index m in string S[] that matches the search word W[].The most' +
                ' straightforward algorithm is to look for a character match at ' +
                'successive values of the index m, the position in the string be' +
                'ing searched, i.e. S[m]. If the index m reaches the end of the ' +
                'string then there is no match, in which case the search is said' +
                'to "fail". At each position m the algorithm first checks for eq' +
                'uality of the first character in the searched for word, i.e. S[' +
                'm] =? W[0]. If a match is found, the algorithm tests the other ' +
                'characters in the searched for word by checking successive valu' +
                'es of the word position index, i. The algorithm retrieves the c' +
                'haracter W[i] in the searched for word and checks for equality ' +
                'of the expression S[m+i] =? W[i]. If all successive characters ' +
                'match in W at position m then a match is found at that position' +
                ' in the search string. (Wikipedia, 2014): https://en.wikipedia.' +
                'org/wiki/Knuth-Morris-Pratt_algorithm';
            pattern = 'https://en.wikipedia.org/wiki/Knuth-Morris-Pratt_algorithm'

            assert.strictEqual knuthMorrisPratt(text, pattern), 915, 'The Pattern was found beginning ' +
                'in the position 915 of the Text'

            pattern = '(https://en.wikipedia.org/wiki/Knuth-Morris-Pratt_algorithm'

            assert.strictEqual knuthMorrisPratt(text, pattern), text.length, 'The Pattern wasn\'t found ' +
                'in the Text'


            arrayText = [3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 4]
            arrayPattern = [8, 9, 8]

            assert.strictEqual knuthMorrisPratt(arrayText, arrayPattern), 5, 'The pattern was found'

            arrayPattern = []

            assert.strictEqual knuthMorrisPratt(arrayText, arrayPattern), arrayText.length, 'The pattern wasn\'t found'
