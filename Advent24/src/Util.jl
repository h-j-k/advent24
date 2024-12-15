readgrid(input) = stack(map(collect, readlines(input)))

flatten(xs, t = identity) = reduce((acc, v) -> vcat(acc, t(v)), xs, init = [])

# https://stackoverflow.com/a/63739791
function partitionby(xs, p)
    indices = vcat(0, findall(p, xs), length(xs))
    map(r -> filter(!p, r), getindex.(Ref(xs), (:).(indices[1:end - 1].+1, indices[2:end])))
end
