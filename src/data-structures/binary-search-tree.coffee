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

    delete: () ->
        if @left is null and @right is null
            if @.isLeftNodeOfParent()
                @parent.left = null
            else if @.isRightNodeOfParent()
                @parent.right = null
            @value = @left = @right = @parent = null
        else if @left is null # has right child
            if @.isLeftNodeOfParent()
                @parent.left = @right
            else if @.isRightNodeOfParent()
                @parent.right = @right
            @right.parent = @parent
            @value = @left = @right = @parent = null
        else if @right is null # has left child
            if @.isLeftNodeOfParent()
                @parent.left = @left
            else if @.isRightNodeOfParent()
                @parent.right = @left
            @left.parent = @parent
            @value = @left = @right = @parent = null
        else # has both childs
            minimum = @findMinimum
            @value = minium.value
            minimum.delete()

    findMinimum: () ->
        return if @left is null then @ else @left.findMinimum()

    findMaximum: () ->
        return if @right is null then @ else @right.findMaximum()

    findByValue: (value) ->
        if value == @value
            return @
        else if value < @value
            return if @left isnt null then @left.findByValue(value) else null
        else
            return if @right isnt null then @right.findByValue(value) else null

    isLeftNodeOfParent: () ->
        return @parent isnt null and @parent.left isnt null and @parent.left.value == @value

    isRightNodeOfParent: () ->
        return @parent isnt null and @parent.right isnt null and @parent.right.value == @value

@algCoffee = if @algCoffee then @algCoffee else {}
@algCoffee.BinarySearchTree = BinarySearchTree
