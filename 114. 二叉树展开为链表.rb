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
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
    @list = []
    preorder(root)
    for i in 0...@list.length-1
        pre = @list[i]
        curr = @list[i+1]
        pre.left = nil
        pre.right = curr
    end

end

def preorder(node)
    return if node.nil?
    @list << node
    preorder(node.left)
    preorder(node.right)
end
