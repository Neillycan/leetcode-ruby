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

# 方法一：前序遍历
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

# 方法二：前序遍历和展开同步进行
def flatten(root)
    return if root.nil?
    stack = [root]
    pre = nil
    while stack.length > 0
        curr = stack.pop
        if !pre.nil?
            pre.left = nil
            pre.right = curr
        end

        left = curr.left
        right = curr.right
        stack << right if !right.nil?
        stack << left if !left.nil?
        pre = curr
    end

end

# 方法三：寻找前驱节点
def flatten(root)
    return if root.nil?
    curr = root
    while !curr.nil?
        # 如果其左子节点不为空
        if !curr.left.nil?
            left = curr.left
            predecessor = left
            # 则在其左子树中找到最右边的节点，作为前驱节点
            while !predecessor.right.nil?
                predecessor = predecessor.right
            end
            # 将当前节点的右子节点赋给前驱节点的右子节点
            predecessor.right = curr.right
            # 然后将当前节点的左子节点赋给当前节点的右子节点，并将当前节点的左子节点设为空。
            curr.left = nil
            curr.right = left
        end
        # 对当前节点处理结束后，继续处理链表中的下一个节点，直到所有节点都处理结束。
        curr = curr.right
    end

end

