try
    module.exports =
        insertionSort: require('./build/sorting/insertion-sort').algCoffe.insertionSort,
        radixSort: require('./build/sorting/radix-sort').algCoffe.radixSort,
        mergeSort: require('./build/sorting/merge-sort').algCoffe.mergeSort,
        karatsubaMultiplication: require('./build/math/karatsuba-multiplication').algCoffe.karatsubaMultiplication,
        bellmanFord: require('./build/graph/bellman-ford').algCoffe.bellmanFord,
        depthFirstSearch: require('./build/graph/depth-first-search').algCoffe.depthFirstSearch,
        BinarySearchTree: require('./build/data-structures/binary-search-tree').algCoffe.BinarySearchTree,
        AdjacencyList: require('./build/data-structures/adjacency-list').algCoffe.AdjacencyList
catch exception
    console.log exception
    window.algCoffe =  if window.algCoffe then window.algCoffe else {}
