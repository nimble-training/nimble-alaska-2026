dOcc_multisite <- nimbleFunction(run =
                     function(x = double(2),  # Argument type annotation for compilation to C++.
                              probOcc = double(1), probDetect = double(2),
                              reps = double(1), n_sites = integer(0), 
                              log = logical(0, default = TRUE)) {
    returnType(double(0))   # Return type annotation for compilation to C++.
    logProb <- 0
    for(j in 1:n_sites) {
        # `ADbreak` ensures that derivatives are not taken with respect to this variable derived
        # from an input argument, as it is used as the extent of a for loop range and therefore not differentiable.
        len  <- ADbreak(reps[j])  
        logProb_x_given_occupied <- 0
        prob_x_given_unoccupied <- 1
        for(i in 1:len) { 
            x_ji <- ADbreak(x[j,i]) # Ensure no derivatives taken with respect to `x_ji` as it is used in `is.na` and condition of an `if` statement
            if(!is.na(x_ji)) { 
                logProb_x_given_occupied <- logProb_x_given_occupied +
                    dbinom(x[j,i], prob = probDetect[j,i], size = 1, log = TRUE)
                if(x_ji == 1) prob_x_given_unoccupied <- 0
            }
        }
        prob_x <- exp(logProb_x_given_occupied) * probOcc[j] + prob_x_given_unoccupied * (1 - probOcc[j])
        logProb <- logProb + log(prob_x)
    }
    if(log) return(logProb) else return(exp(logProb))
}, buildDerivs = list(run = list(ignore=c('i','j','x_ji','len'))) # Ensure that these variables are ignored by NIMBLE's AD system.
)
