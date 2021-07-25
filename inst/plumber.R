library(plumber)

host <- if ('' == Sys.getenv('PLUMBER_HOST')) '0.0.0.0' else Sys.getenv('PLUMBER_HOST')
port <- if ('' == Sys.getenv('PLUMBER_PORT')) 80 else Sys.getenv('PLUMBER_PORT')

pr("inst/sieve.R") %>% pr_run(host = host, port = port)
