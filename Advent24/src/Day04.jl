using LinearAlgebra

xmas(m) = function ((c, r),) 
    sub = get(m, [c-3:c+3, r-3:r+3], ' ')
    reduce((acc, v) -> 
        vcat(acc, join.([v[1:4], v[4:end]])), 
        [vec(sub[4:4, :]), vec(sub[:, 4:4]), diag(sub), diag(reverse(sub, dims = 2))],
        init = []
    )
end

part1(input) = count(x -> 
    x == "XMAS" || x == "SAMX", 
    reduce((acc, v) -> vcat(acc, v), map(xmas(input), Tuple.(findall(c -> c == 'X', input))), init = [])
)

mas(m) = function ((c, r),) 
    sub = get(m, [c-1:c+1, r-1:r+1], ' ')
    reduce((acc, v) -> 
        vcat(acc, join(v)), 
        [diag(sub), diag(reverse(sub, dims = 2))],
        init = []
    )
end

part2(input) = count(xs -> 
    all(x -> x in Set(["MAS", "SAM"]), xs), 
    map(mas(input), Tuple.(findall(c -> c == 'A', input)))
)
