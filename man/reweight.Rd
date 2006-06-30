\name{reweight}
\alias{reweight}
\alias{print.reweight}
\alias{summary.reweight}
\alias{plot.reweight}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Adjust survey respondent weights}
\description{
  Adjusts the weights of survey repondents so that the marginal
distributions of certain variables fit more closely to those from a more
precise source (e.g. Census Bureau's data). 
}
\usage{
reweight(ori, mar, raw=NA, wgt=NA, unique=T, bound=c(0, 100),
trace=F, tolerance=0.1, penalty=0, ...)

\method{print}{reweight}(x, ...)                                       
\method{summary}{reweight}(object, ...)  
\method{plot}{reweight}(x, ...)	
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ori}{ a matrix containing the factor levels. The levels should
start from 1 and count upwards as in \eqn{1,2,\ldots}.}
  \item{mar}{ a vector giving the marginal distributions for each of the
    factors  that are listed in the same order as in \code{ori}. }
  \item{raw}{ a vector of the raw counts of survey respondents
    corresponding to each line in \code{ori}. Default is all one's.}
  \item{wgt}{ a vector of the original weights corresponding to each
    line in \code{ori}.  Default is the value of \code{raw}. }
  \item{unique}{whether the factor level combination in \code{ori}
    matrix is already unique. If \code{FALSE}, it will be made so by
    aggregating the non-unique lines, along with \code{raw} and \code{wgt}.
    Default is \code{TRUE}.}
  \item{bound}{a vector of two elements giving the lower and upper
    bounds for the final weight ratios. The extreme weight ratio is
    reset to either the lower or upper bound. Default is c(0,100).  In
    application a more practical bound might be c(0.5,2).}
   \item{trace}{if \code{TRUE}, show the path of the golden selection
     search of best regularization parameter \eqn{r}. Default is \code{FALSE}.}
   \item{tolerance}{the percentage of the smallest eigenvalue that is to
     be used as the lower start point of the golden selection
     searhch. Default is 0.1.}
   \item{penalty}{measures the strength of a penalty term (it puts penalty
     if the number of zero weighting ratios is large) in the GCV
     function. It is a multiplicative factor of the form \eqn{(1+q)^p},
     where \eqn{p} is the \code{penalty} and \eqn{q} is the percentage
     of zero weighting ratios. Default is 0 (no penalty).}
   \item{x}{an object returned by calling \code{reweight}.}
   \item{object}{an object returned by calling \code{reweight}.}
   \item{...}{parameters to be passed to the generic fucntion.}
}

\details{ \code{ori}, \code{raw}, \code{wgt} typically come from survey
data with categorical responses. The intent is to adjust the \code{wgt}
so that the survey sample is more representative of the universe from
where it comes. It is accomplished by fitting the marginal distributions
of the sample to those of the universe, or those from a more precise
source (e.g. census data). The method is based on the Tikhonov
regularization.

The \code{print} method prints out the weight ratios, along with their
corresponding factor level combinations. This data can then be matched
back to the original sample data to adjust the original weights (by
multipling each original weight with the weight ratio).

The \code{summary} method prints out various running statistics.

The \code{plot} method makes a panel of four diagnostic plots. 
}

\value{
None. 
}
\references{Feiming Chen (2006) \emph{A Heuristic Method for Weighting
    Survey Respondents}. JSM 2006 Proceedings.}
\author{Feiming Chen}
%\note{}

% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{pumswgt}}}
\examples{
data(pumswgt)
r1 <- reweight(pumswgt$ori,pumswgt$mar,pumswgt$wgt)
plot(r1)
summary(r1)
r2 <- reweight(pumswgt$ori,pumswgt$mar,pumswgt$raw)
plot(r2)
summary(r2)
w <- print(r2)
}
\keyword{survey}% at least one, from doc/KEYWORDS
