# https://www.rplumber.io/articles/security.html#cross-origin-resource-sharing-cors
#* @filter cors
cors <- function(res) {
  res$setHeader('Access-Control-Allow-Origin', '*')
  res$setHeader('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, DELETE, PUT')
  res$setHeader('Access-Control-Allow-Headers', 'append,delete,entries,foreach,get,has,keys,set,values,Authorization')

  plumber::forward()
}

#* @get /sieve
#* @post /sieve
function(limit) sieveR::erastosthenesSieve(as.numeric(limit))
