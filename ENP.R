#random allocation
#with geography
#model seats
#swing and 

percs <- c(0.75,0.25)

#effective number of parties
ENP <- function(vote_shares){
  sum <- 0 
  for (n in 1:length(vote_shares)){
    share = vote_shares[n]
    sum <- sum + (share^2)
  }
  
  return(1/sum)
}

# ENPG <- function(vote_shares){
#   sum <- 0 
#   for (n in 1:length(vote_shares)){
#     share = vote_shares[n]
#     sum <- sum + (share^2)
#   }
#   
#   return(1/sum)
# }

ENP(percs)