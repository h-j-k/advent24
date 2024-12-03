@testitem "Test" begin
    include("../src/Day03.jl")
    using DelimitedFiles
    input = readlines("../input/Day03.txt")[1]
    output = parse.(Int, readlines("../output/Day03.txt"))
    @test part1(input) == output[1]
end
