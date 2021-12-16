# https://www.rplumber.io/articles/security.html#cross-origin-resource-sharing-cors
#* @filter cors
cors <- function(res) {
  res$setHeader('Access-Control-Allow-Origin', '*')
  plumber::forward()
}

#* @preempt cors
#* @get /sieve
#* @post /sieve
function(limit) sieveR::erastosthenesSieve(as.numeric(limit))
