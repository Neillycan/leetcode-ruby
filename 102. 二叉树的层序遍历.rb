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
# @return {Integer[][]}
def level_order(root)
    @res = []
    dfs(root,0)
    @res
end

def dfs(node,level)
    return if node.nil?
    @res[level] = [] if @res.size == level
    @res[level] << node.val
    dfs(node.left,level+1)
    dfs(node.right,level+1)
end
