\name{canopyInterception}
\alias{canopyInterception}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
canopyInterception(preType, Tair, LAI, P, Smean, L0, c, MaxCanopyStorage)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{preType}{
%%     ~~Describe \code{preType} here~~
}
  \item{Tair}{
%%     ~~Describe \code{Tair} here~~
}
  \item{LAI}{
%%     ~~Describe \code{LAI} here~~
}
  \item{P}{
%%     ~~Describe \code{P} here~~
}
  \item{Smean}{
%%     ~~Describe \code{Smean} here~~
}
  \item{L0}{
%%     ~~Describe \code{L0} here~~
}
  \item{c}{
%%     ~~Describe \code{c} here~~
}
  \item{MaxCanopyStorage}{
%%     ~~Describe \code{MaxCanopyStorage} here~~
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
function (preType, Tair, LAI, P, Smean, L0, c, MaxCanopyStorage) 
{
    storage = 0
    overStorage = rep(0, times = length(P))
    I = rep(0, times = length(P))
    for (i in 1:length(P)) {
        if (preType[i] == 1) {
            ps = 67.92 + 51.25 * exp(Tair[i]/2.59)
            S = Smean * (0.27 + (46/ps))
            Lstar = S * LAI
            k = 1/Lstar
            Il = (Lstar - L0) * (1 - exp(-k * P[i]))
            I[i] = Il * c
            overStorage[i] = 0
            storage = 0
        }
        else {
            I[i] = 0
            storage = storage + P[i]
            if (storage > MaxCanopyStorage) {
                overStorage[i] = storage - MaxCanopyStorage
                storage = MaxCanopyStorage
            }
            else {
                overStorage[i] = 0
            }
        }
        L0 = I[i]
    }
    WY = P - I
    WY[preType == 0] = overStorage[preType == 0]
    return(WY)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
