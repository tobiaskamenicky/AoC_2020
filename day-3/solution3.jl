module Day03

function traverse(values::Vector{SubString{String}}, right::Int, down::Int)
    treeCount = 0
    x = 1
    y = 1
    while y <= length(values)
        if values[y][x] == '#'
            treeCount += 1
        end
        x = mod1(x+right, length(values[y]))
        y += down
    end
    return treeCount
end;

function part1(values::Vector{SubString{String}})
    return traverse(values, 3, 1)
end;

function part2(values::Vector{SubString{String}})
    return foldl(*, [
        traverse(values, 1, 1),
        traverse(values, 3, 1),
        traverse(values, 5, 1),
        traverse(values, 7, 1),
        traverse(values, 1, 2),
    ])
end;

function day03()
    input = open(f->read(f, String), raw"day-3/input.txt")
    values = split(input)
    
    [part1(values), part2(values)]
end;

result = @time day03()
println(result)

end