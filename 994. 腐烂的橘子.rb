# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)

    # 边界 长宽    
    m1 = grid.length
    n1 = grid[0].length
    queue = []

    # count 表示新鲜橘子的数量
    count = 0

    #  遍历二维数组 找出所有的新鲜橘子和腐烂的橘子
    for r in 0...m1
        for c in 0...n1
            if grid[r][c] == 1
                # 新鲜橘子计数
                count+=1
            elsif grid[r][c] == 2
                # 腐烂的橘子就放进队列 缓存腐烂橘子的坐标
                queue << [r,c]
            end
        end
    end

    # round 表示腐烂的轮数，或者分钟数
    round = 0

    # 如果有新鲜橘子 并且 队列不为空
    # 直到上下左右都触及边界 或者 被感染的橘子已经遍历完
    while count > 0 && queue.length > 0

        # BFS 层级 + 1
        round+=1

        # 拿到当前层级的腐烂橘子数量， 因为每个层级会更新队列
        n = queue.length

        for i in 0...n 
            # 踢出队列（拿出一个腐烂的橘子）
            orange = queue.shift

            # 恢复橘子坐标
            r = orange[0]
            c = orange[1]

            # ↑ 上邻点 判断是否边界 并且 上方是否是健康的橘子
            if r-1>=0 && grid[r-1][c] == 1
                # 感染它 
                grid[r-1][c] = 2
                # 好橘子 -1 
                count-=1
                # 把被感染的橘子放进队列 并缓存
                queue << [r-1,c]
            end

            # ↓ 下邻点 同上
            if r+1<m1 && grid[r+1][c] == 1
                grid[r+1][c] = 2
                count-=1
                queue << [r+1,c]
            end

            # ← 左邻点 同上
            if c-1>=0 && grid[r][c-1] == 1
                grid[r][c-1] = 2
                count-=1
                queue << [r,c-1]
            end
  
            # → 右邻点 同上
            if c+1<n1 && grid[r][c+1] == 1
                grid[r][c+1] = 2
                count-=1
                queue << [r,c+1]
            end

        end



    end

    # 如果此时还有健康的橘子
    # 返回 -1
    # 否则 返回层级
    if count > 0
        return -1
    else
        return round
    end
end
