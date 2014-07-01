### @author Bruno Roberto Búrigo 2014 ###

class BinarySearchTree

    constructor: (value, parent = null) ->
        @value = value # anything
        @parent = parent # BinarySearchTree
        @left = null # BinarySearchTree
        @right = null # BinarySearchTree

    insert: (value) ->
        if value < @value
            if @left is null
                @left = new BinarySearchTree(value, @)
                return @left
            else
                @left.insert(value)
        else
            if @right is null
                @right = new BinarySearchTree(value, @root)
                return @right
            else
                @right.insert(value)

    deleteNode: (node) ->
        ''
        ###
        if node.left is null and node.right is null # node has no childs
            if _isLeftNodeOfParent(node)
                parent.left = null
            else if _isRightNodeOfParent(node)
                parent.right = null
            delete node
        else if node.left is null # node has right child
            if _isLeftNodeOfParent(node)
                node.parent.left = node.rigth
            else if _isRightNodeOfParent(node)
                node.parent.right = node.right
            node.right.parent = node.parent
            delete node
        else if node.right is null # node has left child
            if _isLeftNodeOfParent(node)
                node.parent.left = node.left
            else if _isRightNodeOfParent(node)
                node.parent.right = node.left
            node.left.parent = node.parent
            delete node
        else # node has both childs
            'nothing'
        ###

    findMinimum: () ->
        return if @left is null then @ else @left.findMinimum()

    deleteFirstNodeWithValue: (value) ->

    findNode: (node) ->
        ''

    findFirstNodeWithValue: (value) ->
        ''

    _isLeftNodeOfParent = () ->
        return @parent isnt null and @parent.left isnt null and @parent.left.value == @value

    _isRightNodeOfParent = () ->
        return @parent isnt null and @parent.right isnt null and @parent.right.value == @value

@algCoffe = if @algCoffe then @algCoffe else {}
@algCoffe.BinarySearchTree = BinarySearchTree
