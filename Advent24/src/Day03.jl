process(regex::Regex, input::String) = sum(map(m -> reduce(*, parse.(Int, m.captures)), eachmatch(regex, input)))

part1(input::String) = process(r"mul\((\d{1,3}),(\d{1,3})\)", input)
