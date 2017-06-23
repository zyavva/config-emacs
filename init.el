(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (json-mode
     ;; requires 'markdown' command-line tool installed in system
     markdown-mode))))

(custom-set-faces)

(setq backup-directory-alist `(("." . "~/.saves")))

(setq url-proxy-services
 '(("no_proxy" . "^(localhost|127\.0\.0\.1)")
  ("http" . "127.0.0.1:3128")
  ("https" . "127.0.0.1:3128")))

(global-linum-mode t)
(global-whitespace-mode)
(setq whitespace-style '(face spaces trailing space-before-tab newline indentation
 empty space-after-tab space-mark tab-mark newline-mark))

;; spelling - requires 'aspell' program installed
(setq ispell-program-name "aspell")
(require 'ispell)

(server-start)
