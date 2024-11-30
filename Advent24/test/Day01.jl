@testitem "Test" begin
    include("../src/Day01.jl")
    using DelimitedFiles
    input = readdlm("../input/Day01.txt", Int)
    output = readdlm("../output/Day01.txt", Int)
    @test part1(input) == output[1, 1]
    @test part2(input) == output[2, 1]
end
