#* @get /sieve
#* @post /sieve
function(limit) sieveR::erastosthenesSieve(as.numeric(limit))
