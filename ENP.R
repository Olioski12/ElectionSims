#random allocation
#with geography
#model seats
#swing and 

percs <- c(0.3947,0.3189,0.1971,0.0466,0.0345,0.0082)
seat_percs <- c(0.5444,0.2929,0.1302,0.0296,0.0029,0)

#effective number of parties
ENP <- function(vote_shares){
  sum <- 0 
  for (n in 1:length(vote_shares)){
    share = vote_shares[n]
    sum <- sum + (share^2)
  }
  
  return(1/sum)
}

Gallagher <- function(vote_shares, seat_shares){
  sum <- 0 
  for (n in 1:length(vote_shares)){
    share = vote_shares[n]*100;
    seat = seat_shares[n]*100;
    sum <- sum+(seat-share)^2
  }
  
  return(sqrt(sum/2))
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
Gallagher(percs,seat_percs)