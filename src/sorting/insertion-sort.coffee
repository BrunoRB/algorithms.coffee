
insertionSort = (array) ->

    for i in [1...array.length] by 1
        aux = array[i]
        j = i

        while j > 0 and aux < array[j - 1]
            array[j] = array[j - 1]
            j -= 1

        array[j] = aux

    return array


try
    module.exports = insertionSort
catch exception
    window.algCoffe =  if window.algCoffe then window.algCoffe else {}
    window.algCoffe.insertionSort = insertionSort
