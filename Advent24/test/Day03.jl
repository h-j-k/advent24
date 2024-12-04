@testitem "Test" begin
    include("../src/Day03.jl")
    input = join(readlines("../input/Day03.txt"))
    output = parse.(Int, readlines("../output/Day03.txt"))
    @test part1(input) == output[1]
    @test part2(input) == output[2]
end
