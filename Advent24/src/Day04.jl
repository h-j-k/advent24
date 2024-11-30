include("Util.jl")

using LinearAlgebra

xmas(m) = function ((c, r),) 
    sub = get(m, [c-3:c+3, r-3:r+3], ' ')
    flatten(
        [vec(sub[4:4, :]), vec(sub[:, 4:4]), diag(sub), diag(reverse(sub, dims = 2))],
        v -> join.([v[1:4], v[4:end]])
    )
end

part1(input) = count(x -> 
    x == "XMAS" || x == "SAMX", 
    flatten(map(xmas(input), Tuple.(findall(c -> c == 'X', input))))
)

mas(m) = function ((c, r),) 
    sub = get(m, [c-1:c+1, r-1:r+1], ' ')
    flatten([diag(sub), diag(reverse(sub, dims = 2))], join)
end

part2(input) = count(xs -> 
    all(x -> x in Set(["MAS", "SAM"]), xs), 
    map(mas(input), Tuple.(findall(c -> c == 'A', input)))
)
