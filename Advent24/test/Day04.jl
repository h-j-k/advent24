@testitem "Test" begin
    include("../src/Day04.jl")
    include("../src/Util.jl")
    input = readgrid("../input/Day04.txt")
    output = parse.(Int, readlines("../output/Day04.txt"))
    @test part1(input) == output[1]
    @test part2(input) == output[2]
end
