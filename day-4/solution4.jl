module Day04

using Match

function hasrequiredkeys(dict::Dict{SubString{String}, SubString{String}}) 
    return haskey(dict, "byr") && 
        haskey(dict, "iyr") && 
        haskey(dict, "eyr") && 
        haskey(dict, "hgt") && 
        haskey(dict, "hcl") && 
        haskey(dict, "ecl") && 
        haskey(dict, "pid")    
end 

function hasvalidvalues(dict::Dict{SubString{String}, SubString{String}}) 
    !("1920" <= dict["byr"] <= "2002") && return false
    !("2010" <= get(dict, "iyr", 0) <= "2020") && return false
    !("2020" <= get(dict, "eyr", 0) <= "2030") && return false
    hgt = match(r"^(\d+)(cm|in)$", get(dict, "hgt", 0)) 
    !(hgt !== nothing && @match hgt[2] begin
        "cm" => 150 <= parse(Int, hgt[1]) <= 193
        "in" => 59 <= parse(Int, hgt[1]) <= 76
    end) && return false
    !occursin(r"^#[0-9a-f]{6}$", get(dict, "hcl", 0)) && return false
    !occursin(r"^amb|blu|brn|gry|grn|hzl|oth$", get(dict, "ecl", 0)) && return false
    !occursin(r"^\d{9}$", get(dict, "pid", 0)) && return false
    return true
end

function day04()
    input = open(f->read(f, String), raw"day-4/input.txt")
    passports = split.(split(input, "\n\n";keepempty=false))

    pr1 = 0
    pr2 = 0
    for p in passports
        dict = Dict(split.(p, ":"))
        !hasrequiredkeys(dict) && continue
        pr1 += 1
        !hasvalidvalues(dict) && continue
        pr2 += 1
    end

    [pr1, pr2]
end;

result = @time day04()
println(result)

end