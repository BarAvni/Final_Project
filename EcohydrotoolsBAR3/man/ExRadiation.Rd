\name{ExRadiation}
\alias{ExRadiation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ExRadiation(date, lat, LAI_living, LAI)
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
function (date, lat, LAI_living, LAI) 
{
    lat = NISTdegTOradian(lat)
    Gsc = 0.082
    require(lubridate)
    J = yday(date)
    delta = 0.409 * sin(2 * pi/365 * J - 1.39)
    d_r = 1 + 0.033 * cos(2 * pi/365 * J)
    w_s = acos(-tan(lat) * tan(delta))
    Ra = 24 * 60/pi * Gsc * d_r * (w_s * sin(lat) * sin(delta) + 
        cos(lat) * cos(delta) * sin(w_s))
    Ra = Ra * (LAI/LAI_living)
    Ra
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
