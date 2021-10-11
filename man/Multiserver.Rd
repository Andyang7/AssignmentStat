\name{Multiserver}
\alias{Multiserver}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ classifying_customers
%%  ~~function to do ... ~~
}
\description{ multiserver is a collection of functions designed to test
customers queing in a first come and first serve system.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Multiserver(Arrivals, ServiceTimes, NumServers = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Arrivals}{
%%     ~~Describe \code{Arrivals} here~~
}
  \item{ServiceTimes}{
%%     ~~Describe \code{ServiceTimes} here~~
}
  \item{NumServers}{
%%     ~~Describe \code{NumServers} here~~
}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Arrivals, ServiceTimes, NumServers = 1)
{
    if (any(Arrivals <= 0 | ServiceTimes <= 0) || NumServers <=
        0) {
        stop("Arrivals, ServiceTimes must be positive & NumServers must be positive")
    }
    if (length(Arrivals) != length(ServiceTimes)) {
        stop("Arrivals and ServiceTimes must have the same length")
    }
    NumCust = length(Arrivals)
    AvailableFrom <- rep(0, NumServers)
    ChosenServer <- ServiceBegins <- ServiceEnds <- rep(0, NumCust)
    for (i in seq_along(Arrivals)) {
        avail <- min(AvailableFrom)
        ChosenServer[i] <- which.min(AvailableFrom)
        ServiceBegins[i] <- max(avail, Arrivals[i])
        ServiceEnds[i] <- ServiceBegins[i] + ServiceTimes[i]
        AvailableFrom[ChosenServer[i]] <- ServiceEnds[i]
    }
    out <- dplyr::tibble(Arrivals, ServiceBegins, ChosenServer,
        ServiceEnds)
    return(out)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
