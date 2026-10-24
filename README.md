# BEAM WAF
(**Work in progress!**)

A software-based Web Application Firewall (WAF) written in Elixir.


## Roadmap
- validating HTTP request based on its headers and body
- passing request to the protected server
- allow- and blocklists for IP addresses
- parallel request verification against defined rules
- distributed validation using several BEAM VM nodes (for load balancing)
- rule execution implemented in Elixir or as NIFs in Rust (to be determined)
- rate limiting
- creating metrics endpoint for Prometheus