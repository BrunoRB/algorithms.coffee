try
    module.exports =
        insertionSort: require('./build/sorting/insertion-sort'),
        radixSort: require('./build/sorting/radix-sort'),
        mergeSort: require('./build/sorting/merge-sort'),
        karatsubaMultiplication: require('./build/math/karatsuba-multiplication'),
        bellmanFord: require('./build/graph/bellman-ford'),
        depthFirstSearch: require('./build/graph/depth-first-search'),
        BinarySearchTree: require('./build/data-structures/binary-search-tree'),
        AdjacencyList: require('./build/data-structures/adjacency-list')
catch exception
    console.log exception
    window.algCoffe =  if window.algCoffe then window.algCoffe else {}
