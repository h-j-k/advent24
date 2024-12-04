part1(input::String) = sum(map(m -> reduce(*, parse.(Int, m.captures)), eachmatch(r"mul\((\d{1,3}),(\d{1,3})\)", input)))

part2(input::String) = part1(join(split(input, r"don't\(\).*?(do\(\)|$)")))
