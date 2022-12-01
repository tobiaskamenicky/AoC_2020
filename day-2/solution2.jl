module Day02

function part1(values::Vector{Tuple{Int, Int, Char, SubString{String}}})
    return count(x -> x[1] <= count(x[3], x[4]) <= x[2], values)
end;

function part2(values::Vector{Tuple{Int, Int, Char, SubString{String}}})
    return count(x -> (x[4][x[1]] == x[3]) ⊻ (x[4][x[2]] == x[3]), values)
end;

function day02()
    input = open(f->read(f, String), raw"day-2/input.txt")

    values = Tuple{Int, Int, Char, SubString{String}}[]
    for x in eachmatch(r"(\d+)-(\d+) (\w): (\w+)", input)
        push!(values, (parse(Int, x[1]), parse(Int, x[2]), only(x[3]), x[4]))
    end 
        
    [part1(values), part2(values)]
end;

result = @time day02()
println(result)

end