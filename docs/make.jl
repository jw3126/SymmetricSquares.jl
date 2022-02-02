using SymmetricSquares
using Documenter

DocMeta.setdocmeta!(SymmetricSquares, :DocTestSetup, :(using SymmetricSquares); recursive=true)

makedocs(;
    modules=[SymmetricSquares],
    authors="Elias Kempf <34234056+icetube23@users.noreply.github.com> and contributors",
    repo="https://github.com/icetube23/SymmetricSquares.jl/blob/{commit}{path}#{line}",
    sitename="SymmetricSquares.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://icetube23.github.io/SymmetricSquares.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/icetube23/SymmetricSquares.jl",
    devbranch="main",
)
