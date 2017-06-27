(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (fold-this expand-region intero json-mode markdown-mode))))

(custom-set-faces)

(setq backup-directory-alist `(("." . "~/.saves")))

(setq url-proxy-services
 '(("no_proxy" . "^(localhost|127\.0\.0\.1)")
  ("http" . "127.0.0.1:3128")
  ("https" . "127.0.0.1:3128")))

(global-linum-mode t)
(global-whitespace-mode)
(setq whitespace-style
 '(face spaces trailing space-before-tab newline empty space-after-tab space-mark tab-mark newline-mark))

;; spelling - requires 'aspell' program installed
(setq ispell-program-name "aspell")
(require 'ispell)

(require 'expand-region)
(global-set-key (kbd "C-M-w") 'er/expand-region)

(require 'fold-this)
(global-set-key (kbd "C-c C--") 'fold-this-all)
(global-set-key (kbd "C-c C-+") 'fold-this)
(global-set-key (kbd "C-c M-+") 'fold-this-unfold-all)

(server-start)
