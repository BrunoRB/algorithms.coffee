try
    module.exports =
        insertionSort: require('./build/sorting/insertion-sort').algCoffee.insertionSort,
        radixSort: require('./build/sorting/radix-sort').algCoffee.radixSort,
        mergeSort: require('./build/sorting/merge-sort').algCoffee.mergeSort,
        karatsubaMultiplication: require('./build/math/karatsuba-multiplication').algCoffee.karatsubaMultiplication,
        bellmanFord: require('./build/graph/bellman-ford').algCoffee.bellmanFord,
        depthFirstSearch: require('./build/graph/depth-first-search').algCoffee.depthFirstSearch,
        kosaraju: require('./build/graph/kosaraju').algCoffee.kosaraju,
        BinarySearchTree: require('./build/data-structures/binary-search-tree').algCoffee.BinarySearchTree,
        AdjacencyList: require('./build/data-structures/adjacency-list').algCoffee.AdjacencyList
catch exception
    console.log exception
    window.algCoffee =  if window.algCoffee then window.algCoffee else {}
