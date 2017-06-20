(require 'package)

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages (quote (json-mode markdown-mode))))

(custom-set-faces)

(setq backup-directory-alist `(("." . "~/.saves")))

(server-start)
