try
    module.exports =
        insertionSort: require('./build/sorting/insertion-sort').algCoffee.insertionSort
        radixSort: require('./build/sorting/radix-sort').algCoffee.radixSort
        mergeSort: require('./build/sorting/merge-sort').algCoffee.mergeSort
        karatsubaMultiplication: require('./build/math/karatsuba-multiplication').algCoffee.karatsubaMultiplication
        bellmanFord: require('./build/graph/bellman-ford').algCoffee.bellmanFord
        depthFirstSearch: require('./build/graph/depth-first-search').algCoffee.depthFirstSearch
        edmondsKarp: require('./build/graph/edmonds-karp').algCoffee.edmondsKarp
        kosaraju: require('./build/graph/kosaraju').algCoffee.kosaraju
        kruskal: require('./build/graph/kruskal').algCoffee.kruskal
        longestCommonSubsequence: require('./build/string/longest-common-subsequence').
            algCoffee.longestCommonSubsequence
        AdjacencyList: require('./build/data-structures/adjacency-list').algCoffee.AdjacencyList
        BinarySearchTree: require('./build/data-structures/binary-search-tree').algCoffee.BinarySearchTree
        DisjointSet: require('./build/data-structures/disjoint-set').algCoffee.DisjointSet
        SegmentTree: require('./build/data-structures/segment-tree').algCoffee.SegmentTree
catch exception
    console.log exception
    window.algCoffee =  if window.algCoffee then window.algCoffee else {}
