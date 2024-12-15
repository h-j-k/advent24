include("Util.jl")

iscorrect(rulegroups) = (pages -> all(((i, page),) -> all(v -> v in get(rulegroups, page, Set()), pages[i + 1:end]), enumerate(pages)))

middlesum(updates) = map(update -> parse(Int, update[trunc(Int, (length(update) + 1) / 2)]), updates) |> sum

function part1(input)
    (rules, updates) = partitionby(input, r -> r == "")
    rulegroups = mergewith(union, map(rule -> let (k, v) = split(rule, "|"); Dict(k => Set([v])); end, rules)...)
    filter(iscorrect(rulegroups), map(update -> split(update, ","), updates)) |> middlesum
end
