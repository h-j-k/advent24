include("Util.jl")

process(input) = let (rules, updates) = partitionby(input, r -> r == "")
    (mergewith(union, map(rule -> let (k, v) = split(rule, "|"); Dict(k => Set([v])); end, rules)...), 
    map(update -> split(update, ","), updates))
end

iscorrect(rules) = (pages -> all(((i, page),) -> all(v -> v in get(rules, page, Set()), pages[i + 1:end]), enumerate(pages)))

middlesum(updates) = map(update -> parse(Int, update[trunc(Int, (length(update) + 1) / 2)]), updates) |> sum

function part1(input)
    (rules, updates) = process(input)
    filter(iscorrect(rules), updates) |> middlesum
end

function part2(input)
    (rules, updates) = process(input)
    map(update -> 
        let x = trunc(Int, (length(update) - 1) / 2); filter(page -> count(v -> v in get(rules, page, Set()), update) == x, update) end, 
        filter(!iscorrect(rules), updates)
    ) |> middlesum
end
