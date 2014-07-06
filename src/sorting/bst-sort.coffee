### @author Bruno Roberto Búrigo 2014 ###

if typeof module isnt 'undefined'
    BinarySearchTree = require('./../data-structures/binary-search-tree').algCoffee.BinarySearchTree
else
    BinarySearchTree = algCoffee.BinarySearchTree

bstSort = (array) ->
    bstRoot = new BinarySearchTree(array[0])
    for i in [1...array.length] by 1
        bstRoot.insert(array[i])

    index = 0
    traverseInOrder = (bst) ->
        if bst.left isnt null
            traverseInOrder(bst.left)

        array[index] = bst.value
        index += 1

        if bst.right isnt null
            traverseInOrder(bst.right)

    traverseInOrder(bstRoot)

    return array

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.bstSort = bstSort
