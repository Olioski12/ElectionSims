#random allocation
#with geography
#model seats
#swing and 

percs <- c(3947,3189,1971,466,345,82)
seat_percs <- c(0.5444,0.2929,0.1302,0.0296,0.0029,0)

#effective number of parties
ENP <- function(vote_shares){
  tsum = sum(vote_shares);
  vote_shares <- vote_shares/tsum
  sum <- 0 
  for (n in 1:length(vote_shares)){
    share = vote_shares[n]
    sum <- sum + (share^2)
  }
  
  return(1/sum)
}

Gallagher <- function(vote_shares, seat_shares){
  tsum = sum(vote_shares);
  vote_shares <- vote_shares/tsum*100
  tsum2 = sum(seat_shares);
  seat_shares <- seat_shares/tsum2*100
  sum <- 0 
  for (n in 1:length(vote_shares)){
    share = vote_shares[n];
    seat = seat_shares[n];
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