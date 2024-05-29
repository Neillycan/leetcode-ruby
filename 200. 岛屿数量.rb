# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    count = 0
    for i in 0...grid.length
        for j in 0...grid[0].length
            if grid[i][j] == "1"
                dfs(grid,i,j)
                count+=1
            end
        end
    end

    return count
end

def dfs(grid,i,j)
    return if i < 0 || i >= grid.length || j < 0 || j >= grid[0].length
    return if grid[i][j] != "1"
    grid[i][j] = "2"
    dfs(grid,i+1,j)
    dfs(grid,i,j+1)
    dfs(grid,i-1,j)
    dfs(grid,i,j-1)
end
