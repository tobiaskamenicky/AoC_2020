module Day01

function part1(values::Array{Int,1})
    res = values[2020 .- values .∈ Ref(values)]
    return foldl(*,res)
end;

function part2(values::Array{Int,1})
    for num in values
        res = values[2020 - num .- values .∈ Ref(values)]
        !isempty(res) && return foldl(*, res) * num
    end
end;

function day01()
    input = open(f->read(f, String), raw"day-1/input.txt")
    numbers = parse.(Int, split(input))
    
    [part1(numbers), part2(numbers)]
end;

result = @time day01()
println(result)

end
