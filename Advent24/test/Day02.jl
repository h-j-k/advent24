@testitem "Test" begin
    include("../src/Day02.jl")
    using DelimitedFiles
    input = map(row -> map(col -> parse(Int, col), split(row)), eachline("../input/Day02.txt"))
    output = readdlm("../output/Day02.txt", Int)
    @test part1(input) == output[1, 1]
    @test part2(input) == output[2, 1]
end
