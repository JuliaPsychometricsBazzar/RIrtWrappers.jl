using CondaPkg
using Pkg


function fix_rcall()
    withenv() do
        proj = Base.active_project()
        for p in values(Pkg.dependencies())
            if p.name == "RIrtWrappers"
                Pkg.activate("RIrtWrappers")
                break
            end
        end
        ENV["R_HOME"] = "$(CondaPkg.envdir())/lib/R"
        Pkg.build("RCall")
        Pkg.activate(proj)
    end
end

function withrenv(f::Function)
    withenv() do
        ENV["R_HOME"] = "$(CondaPkg.envdir())/lib/R"
        f()
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    fix_rcall()
end
