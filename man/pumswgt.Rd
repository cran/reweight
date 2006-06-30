\name{pumswgt}
\alias{pumswgt}
\docType{data}
\title{Household Distribution of Tenure and Household Size From PUMS}
\description{This data gives the joint and marginal distributions of Tenure (2
levels) and Household Size (5 levels) in Florida from US Census data.}

\usage{data(pumswgt)}
\format{
  A list with 4 components:
  \describe{
    \item{\code{ori}}{ 
      A data frame with 10 observations on the following 2 variables.
      \describe{
	\item{\code{tenure}}{Factor \emph{Tenure} with two levels: 1=Owner, 2=Renter}
	\item{\code{hhsize}}{Factor \emph{Household Size} with
	  five levels: 1=1 Person, 2=2 Person,3=3 Person,4=4 Person,5=5+ Person}
      }
    }
    
    \item{\code{mar}}{A vector of marginal counts with the following 7
values.
  \describe{
    \item{\code{ten1}}{Counts of owned households (Tenure)}
    \item{\code{ten2}}{Counts of rented households (Tenure)}
    \item{\code{np1}}{Counts of 1 person households (Household Size) } 
    \item{\code{np2}}{Counts of 2 person households (Household Size) }
    \item{\code{np3}}{Counts of 3 person households (Household Size) }
    \item{\code{np4}}{Counts of 4 person households (Household Size) }
    \item{\code{np5}}{Counts of 5 person households (Household Size) }
  }
  }

  \item{\code{raw}}{Raw counts of households in each factor level combination.}
  \item{\code{wgt}}{Original weights of households in each factor level combination}
}
}
\details{
  The \code{ori}, \code{raw}, and \code{wgt} components are from US
Census ACS (American Community Survey) PUMS (Public Use Micro Sample)
2004 data set containing two demographic factors: Tenure (\emph{ten})
and Household Size (\emph{np}), along with a weight variable
\emph{wgtp}, for the state Florida. They are further collapsed using the
\R function \code{aggregate} so that each factor combination in
\code{ori} is unique.

  The \code{mar} component gives the marginal distribution of Tenure (2
levels) and Household Size (5 levels) from US Census SF1 (Summary File
1) 2000 data containing table H4 (Tenure) and H13 (Household Size) for
the state Florida. 
}
\source{
  The data is downloaded from two data sources in Census website
  \url{http://dataferrett.census.gov}: 
  \itemize{
    \item ACS (American Community Survey) PUMS (Public Use Micro Sample)
    2004.
    \item SF1 (Summary File 1) 2000.
  }
  }
\references{Feiming Chen (2006) \emph{A Heuristic Method for Weighting
    Survey Respondents}. JSM 2006 Proceedings.}
\examples{
data(pumswgt)
}
\keyword{datasets}
