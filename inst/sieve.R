# https://www.rplumber.io/articles/security.html#cross-origin-resource-sharing-cors
# https://github.com/rstudio/plumber/issues/66#issuecomment-418660334
#* @filter cors
cors <- function(req, res) {
  res$setHeader('Access-Control-Allow-Origin', '*')

  if (req$REQUEST_METHOD == 'OPTIONS') {
    res$setHeader('Access-Control-Allow-Methods','*')
    res$setHeader('Access-Control-Allow-Headers', req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200
    return(list())
  } else {
    plumber::forward()
  }
}

#* @get /sieve
#* @post /sieve
function(limit) sieveR::erastosthenesSieve(as.numeric(limit))
