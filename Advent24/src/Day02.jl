using StatsBase

function isSafe(levels::Vector{Int64})
    reduce(
        (acc, v) -> (acc[1] && (acc[2] == (acc[3] < v)) && (1 <= abs(v - acc[3]) <= 3), acc[2], v), 
        levels[2:end], 
        init = (true, levels[1] < levels[2], levels[1])
    )[1]
end

function part1(input::Vector{Vector{Int64}})
    count(isSafe, input)
end

function isSafeWithProblemDampener(levels::Vector{Int64})
    isSafe(levels) || any(isSafe, [levels[1:end .!= i] for i in 1:size(levels,1)])
end

function part2(input::Vector{Vector{Int64}})
    count(isSafeWithProblemDampener, input)
end
