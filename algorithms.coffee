
try
    module.exports =
        insertionSort: require('./src/sorting/insertion-sort'),
        radixSort: require('./src/sorting/radix-sort'),
        mergeSort: require('./src/sorting/merge-sort'),
        BinarySearchTree: require('./src/data-structures/binary-search-tree')
catch exception
    console.log exception
    window.algCoffe =  if window.algCoffe then window.algCoffe else {}
