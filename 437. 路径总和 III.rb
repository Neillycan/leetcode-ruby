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
# @param {Integer} target_sum
# @return {Integer}
def path_sum(root, target_sum)
    @target_sum = target_sum
    @hash = Hash.new(0)
    @hash[0] = 1
    return dfs(root,0)
end

def dfs(node,curr)
    return 0 if node.nil?

    ret = 0
    curr += node.val

    ret = @hash[curr - @target_sum] if @hash[curr - @target_sum]
    @hash[curr] += 1

    ret+=dfs(node.left,curr)
    ret+=dfs(node.right,curr)

    @hash[curr] -= 1

    return ret

end

