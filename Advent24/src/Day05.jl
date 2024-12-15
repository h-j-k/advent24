include("Util.jl")

function part1(input)
    (rules, updates) = partitionby(input, r -> r == "")
    rulesgroup = mergewith(union, map(rule -> let (k, v) = split(rule, "|"); Dict(k => Set([v])); end, rules)...)
    pageupdates = map(pages -> split(pages, ","), updates)
    filter(pages ->
        all(((i, page),) -> all(v -> v in get(rulesgroup, page, Set()), pages[i + 1:end]), enumerate(pages)),
        pageupdates
    ) |> (filtered -> map(update -> parse(Int, update[trunc(Int, (length(update) + 1) / 2)]), filtered)) |> sum
end