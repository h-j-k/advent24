@testitem "Test" begin
    include("../src/Day05.jl")
    input = readlines("../input/Day05.txt")
    output = parse.(Int, readlines("../output/Day05.txt"))
    @test part1(input) == output[1]
    # @test part2(input) == output[2]
end
