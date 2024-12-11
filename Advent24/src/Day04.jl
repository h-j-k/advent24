using LinearAlgebra

lookaround(m) = function ((c, r),) 
    sub = get(m, [c-3:c+3, r-3:r+3], ' ')
    reduce((acc, v) -> 
        vcat(acc, join.([v[1:4], v[4:end]])), 
        [vec(sub[4:4, :]), vec(sub[:, 4:4]), diag(sub), diag(reverse(sub, dims = 2))],
        init = []
    )
end

part1(input::Matrix{Char}) = count(x -> 
    x == "XMAS" || x == "SAMX", 
    reduce((acc, v) -> vcat(acc, v), map(lookaround(input), Tuple.(findall(c -> c == 'X', input))), init = [])
)