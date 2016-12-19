\name{Water_yield_cold_env}
\alias{Water_yield_cold_env}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Water_yield_cold_env(LAI_living, LAI, MS, preType, Tair, P, Smean, L0, c, date, lat, Tave, Tmax, Tmin, InfilCap, MaxStorage, month, year)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{LAI_living}{
%%     ~~Describe \code{LAI_living} here~~
}
  \item{LAI}{
%%     ~~Describe \code{LAI} here~~
}
  \item{MS}{
%%     ~~Describe \code{MS} here~~
}
  \item{preType}{
%%     ~~Describe \code{preType} here~~
}
  \item{Tair}{
%%     ~~Describe \code{Tair} here~~
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
  \item{date}{
%%     ~~Describe \code{date} here~~
}
  \item{lat}{
%%     ~~Describe \code{lat} here~~
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
  \item{InfilCap}{
%%     ~~Describe \code{InfilCap} here~~
}
  \item{MaxStorage}{
%%     ~~Describe \code{MaxStorage} here~~
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
function (LAI_living, LAI, MS, preType, Tair, P, Smean, L0, c, 
    date, lat, Tave, Tmax, Tmin, InfilCap, MaxStorage, month, 
    year) 
{
    MaxCanopyStorage = MS * (LAI/LAI_living)
    Q = canopyInterception(preType, Tair, LAI, P, Smean, L0, 
        c, MaxCanopyStorage)
    ET = Evapo_HS(date, lat, LAI_living, LAI, Tave, Tmax, Tmin)
    Runoff_month = runoffCalc(Q, InfilCap, MaxStorage, ET, month, 
        year)
    return(Runoff_month)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
