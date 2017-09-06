(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (neotree fold-this expand-region intero json-mode markdown-mode))))

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

;; starting emacs client full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; spelling - requires 'aspell' program installed
(setq ispell-program-name "aspell")
(require 'ispell)

;; expand selection
(require 'expand-region)
(global-set-key (kbd "C-M-w") 'er/expand-region)

;; fold this
(require 'fold-this)
(global-set-key (kbd "C--") 'fold-active-region)
(global-set-key (kbd "M-+") 'fold-this-unfold-all)

;; NeoTree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Common User Access key bindings
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted

;; (server-start)
