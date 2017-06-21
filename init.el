(require 'package)

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages (quote (json-mode markdown-mode))))

(custom-set-faces)

(setq backup-directory-alist `(("." . "~/.saves")))

(setq url-proxy-services
   '(("no_proxy" . "^(localhost|127\.0\.0\.1)")
     ("http" . "127.0.0.1:3128")
     ("https" . "127.0.0.1:3128")))

(server-start)
