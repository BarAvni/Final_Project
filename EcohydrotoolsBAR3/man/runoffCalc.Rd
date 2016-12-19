\name{runoffCalc}
\alias{runoffCalc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
runoffCalc(Q, InfilCap, MaxStorage, ET, month, year)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Q}{
%%     ~~Describe \code{Q} here~~
}
  \item{InfilCap}{
%%     ~~Describe \code{InfilCap} here~~
}
  \item{MaxStorage}{
%%     ~~Describe \code{MaxStorage} here~~
}
  \item{ET}{
%%     ~~Describe \code{ET} here~~
}
  \item{month}{
%%     ~~Describe \code{month} here~~
}
  \item{year}{
%%     ~~Describe \code{year} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Q, InfilCap, MaxStorage, ET, month, year) 
{
    month_diff = diff(month)
    month_diff[month_diff < 0] = 1
    month_index = which(month_diff \%in\% 1)
    month_index_end = c(month_index, length(month))
    month_index_start = c(1, (month_index_end[1:length(month_index_end) - 
        1] + 1))
    Runoff_month = rep(0, times = length(month_index_end))
    for (m in 1:length(month_index_start)) {
        Runoff = rep(0, times = length(month_index_start[m]:month_index_end[m]))
        storage = 0
        counter = 1
        for (i in month_index_start[m]:month_index_end[m]) {
            storage = storage + Q[i]
            if (storage > MaxStorage) {
                OverStorage = storage - MaxStorage
                storage = MaxStorage
                if (OverStorage > InfilCap) {
                  Runoff[counter] = OverStorage - InfilCap
                }
                else {
                  Runoff[counter] = 0
                }
            }
            else {
                Runoff[counter] = 0
            }
            storage = storage - ET[i]
            if (storage < 0) {
                storage = 0
            }
            counter = counter + 1
        }
        Runoff_month[m] = sum(Runoff)
    }
    return(Runoff_month)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
