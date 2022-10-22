; in page 97 annotation 100, the form '(a) will be translate to (quote (a)) in interpreter
; (quota sth) means treat sth as its literal expression without evaluting
; so (car ''abracadabra) => (car '(quote abracadabra)) => (car (quote (quote abracadabra)))
; (quote (quote abracadabra)): the first quote makes the rest part of expression a literal expression
; so (car (quote abracadabra)) => quote