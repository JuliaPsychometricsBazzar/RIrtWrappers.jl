using RIrtWrappers
using Documenter

format = Documenter.HTML(
    prettyurls=get(ENV, "CI", "false") == "true",
    canonical="https://JuliaPsychometricsBazzar.github.io/RIrtWrappers.jl",
)

makedocs(;
    modules=[RIrtWrappers],
    authors="Frankie Robertson",
    repo="https://github.com/JuliaPsychometricsBazzar/RIrtWrappers.jl/blob/{commit}{path}#{line}",
    sitename="RIrtWrappers.jl",
    format=format,
    pages=[
        "Getting started" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaPsychometricsBazzar/RIrtWrappers.jl",
    devbranch="main",
)
