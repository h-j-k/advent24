using StatsBase

function part1(input::Matrix{Int})
    sum(map((x, y)::Tuple{Int64, Int64} -> abs(x - y), collect(zip(sort(input[:, 1]), sort(input[:, 2])))))
end

function part2(input::Matrix{Int})
    counts = countmap(input[:, 2])
    sum(map((k, v)::Pair{Int64, Int64} -> k * v * get!(counts, k, 0), collect(countmap(input[:, 1]))))
end
