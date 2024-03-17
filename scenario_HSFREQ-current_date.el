;; Example of ttemacs injection file.

;; You need to open this file with emacs to run it.
;; Then, you just have to eval the buffer (M-x eval-buffer).

(load-file "./ttemacs.el")

(tt-configuration '(protocol  erplv2
		    ip        "127.0.0.1"
		    port      40000))

(tt-send "
UNB+IATB:1+UNTO+FROM+240317:1631+002UOSLJ5F0001+++O'&
UNH+1+HSFREQ:02:2:IA+ATID'&
MSG+:M'&
LTS+dd'&
UNT+4+1'&
UNZ+1+002UOSLJ5F0001'
")

(tt-match "
UNB+IATB:1+FROM+UNTO+{%date%=*}:{*}+{%remoteid%=*}+002UOSLJ5F0001++T'&
UNH+1+HSFRES:02:2:IA+ATID'&
LTS+/$DD\r&
SYSTEM TIME IS 1715/0515P ON SUN17MAR24\r&
>'&
UNT+3+1'&
UNZ+1+{*}'
")

;; This is the directive that will start it all.
;; Don't forget it...
(tt-done)
