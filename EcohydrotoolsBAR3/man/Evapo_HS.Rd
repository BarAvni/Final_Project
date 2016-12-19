\name{Evapo_HS}
\alias{Evapo_HS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Evapo_HS(date, lat, LAI_living, LAI, Tave, Tmax, Tmin)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{date}{
%%     ~~Describe \code{date} here~~
}
  \item{lat}{
%%     ~~Describe \code{lat} here~~
}
  \item{LAI_living}{
%%     ~~Describe \code{LAI_living} here~~
}
  \item{LAI}{
%%     ~~Describe \code{LAI} here~~
}
  \item{Tave}{
%%     ~~Describe \code{Tave} here~~
}
  \item{Tmax}{
%%     ~~Describe \code{Tmax} here~~
}
  \item{Tmin}{
%%     ~~Describe \code{Tmin} here~~
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
function (date, lat, LAI_living, LAI, Tave, Tmax, Tmin) 
{
    Ra = ExRadiation(date, lat, LAI_living, LAI)
    T_Diff = abs(Tmax - Tmin)
    EP = abs(0.0135 * 0.17 * 0.408 * (Tave + 17.78) * sqrt(T_Diff) * 
        Ra)
    return(EP)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
