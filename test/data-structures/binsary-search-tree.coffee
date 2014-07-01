
expect = require('chai').expect
BinarySearchTree = require('../../algorithms').BinarySearchTree

describe 'Binary Search Tree', ->

    describe 'Create a new BST', ->
        it 'should create a BST with the root Node having a value 10', ->
            bst = new BinarySearchTree 10

            expect(bst).to.be.a 'object'
            expect(bst.value).to.be.equal 10
            expect(bst.left).to.be.equal null
            expect(bst.right).to.be.equal null

        it 'should create a new BST with the root Node having a object has value', ->
            someData =
                height: 200
                distance: 13.3

            bst = new BinarySearchTree someData

            expect(bst).to.be.a 'object'
            expect(bst.left).to.be.equal null
            expect(bst.right).to.be.equal null
            expect(bst.value).to.be.a 'object'
            expect(bst.value).to.have.property('height').equal 200
            expect(bst.value).to.have.property('distance').equal 13.3

    describe 'Insert values into a BST', ->

        it 'should retrieve the newly created subtree object', ->
            bst = new BinarySearchTree 10

            bstTwo = bst.insert(20)
            bstThree = bst.insert(5)
            bstFour = bst.insert(30)

            for subTree in [bstTwo, bstThree, bstFour]
                expect(subTree).to.be.a 'object'
                expect(subTree).to.be.a 'object'
                expect(subTree.value).to.be.a 'number'

        it 'should place new subtrees at the correct branch of the BST', ->
            bst = new BinarySearchTree 10

            bst.insert(20)
            bst.insert(5)
            bst.insert(30)
            expect(bst.right).to.be.a 'object'
            expect(bst.right).to.be.a 'object'
            expect(bst.right.value).to.be.equal 20

            expect(bst.left).to.be.a 'object'
            expect(bst.left).to.be.a 'object'
            expect(bst.left.value).to.be.equal 5

            expect(bst.right.right).to.be.a 'object'
            expect(bst.right.right).to.be.a 'object'
            expect(bst.right.right.value).to.be.equal 30

    describe 'Find minimum value of a BST', ->
        it 'return the subtree with the root with value 5, the minimum value of the bst', ->
            root = new BinarySearchTree 10
            for value in [20, 5, 30, 15, 12]
                root.insert(value)

            bstMinimum = root.findMinimum()

            expect(bstMinimum).to.be.a 'object'
            expect(bstMinimum.value).to.be.equal 5

        it 'return the subtree of with with value 22, the minimum value of the subtree at right of the root', ->
            root = new BinarySearchTree 10
            for value in [30, 40, 29, 27, 35, 22]
                root.insert(value)

            bstMinimum = root.right.findMinimum()

            expect(bstMinimum).to.be.a 'object'
            expect(bstMinimum.value).to.be.equal 22
