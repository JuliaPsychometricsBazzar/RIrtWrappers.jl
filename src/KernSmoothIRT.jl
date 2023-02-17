module KernSmoothIRT

using CondaPkg
using RCall
using FittedItemBanks

export fit_ks_dichotomous


function fit_ks_dichotomous(df; kwargs...)
    (item_idxs, resp_idxs, weights, evalpoints, occs) = __fit_ks(df; key=1, format=2, kwargs...)
    # XXX: Weights unused. What is it
    resps1 = resp_idxs .== 1
    #item_idxs[resps1, ]
    DichotomousKdeItemBank(evalpoints, occs[resps1, :])
end

function fit_ks_(df; kwargs...)
    (item_idxs, resp_idxs, weights, evalpoints, occs) = __fit_ks(df; key=1, format=2, kwargs...)
    max(item_idxs)
    KdeItemBank(evalpoints, occs[resps1, :])
end

function __fit_ks(df; kernel="gaussian", kwargs...)
    if kernel != "gaussian"
        error("Kernel must be Guassian")
    end
    @debug "Fitting IRT model"
    CondaPkg.withenv() do
        R"""
        library(KernSmoothIRT)
        """
        irt_model = rcall(:ksIRT, df; kwargs...)
        evalpoints = rcopy(R"$irt_model$evalpoints")
        occs = rcopy(R"$irt_model$OCC")
        item_idxs = Int.(@view occs[:, 1])
        resp_idxs = Int.(@view occs[:, 2])
        weights = Int.(@view occs[:, 3])
        occs = occs[:, 4:end]
        (item_idxs, resp_idxs, weights, evalpoints, occs)
    end
end

end
