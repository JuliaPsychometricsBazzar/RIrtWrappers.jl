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
        "Home" => "index.md",
        "Modules" => ["mirt.md", "kernsmoothirt.md"]
    ],
)

deploydocs(;
    repo="github.com/JuliaPsychometricsBazzar/RIrtWrappers.jl",
    devbranch="main",
)
