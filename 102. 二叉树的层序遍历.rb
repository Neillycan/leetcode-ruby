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

#******************递归***********************
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

#******************迭代***********************

def level_order(root)
    return [] if root.nil?

    res = []
    ans = [root]
    while ans.length > 0
        item = []
        len = ans.length
        len.times do 
            node = ans.shift
            item << node.val
            ans << node.left if node.left 
            ans << node.right if node.right
        end
        res << item
    end
    return res
end

