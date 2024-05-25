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

# 方法一：广度优先搜索
def right_side_view(root)
    res = []
    return res if root.nil?

    queue = [root]
    while queue.length > 0
        len = queue.length
        for i in 0..len-1
            node = queue.shift
            queue << node.left if node.left
            queue << node.right if node.right
            res << node.val if i == len-1
        end

    end

    return res

end


#方法二：深度优先搜索
def right_side_view(root)
    @res = []
    return @res if root.nil?
    dfs(root,0)
    return @res
end

def dfs(root,depth)
    return if root.nil?
    if depth == @res.length
        @res << root.val
    end
    depth+=1
    dfs(root.right,depth)
    dfs(root.left,depth)
end
