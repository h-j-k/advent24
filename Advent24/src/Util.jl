readgrid(input) = stack(map(collect, readlines(input)))

flatten(xs, t = identity) = reduce((acc, v) -> vcat(acc, t(v)), xs, init = [])
