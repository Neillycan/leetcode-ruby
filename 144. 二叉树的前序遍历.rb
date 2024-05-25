# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
    @res = []
    preorder(root)
    return @res
end

def preorder(node)
    return if node.nil?
    @res << node.val
    preorder(node.left)
    preorder(node.right)
end
