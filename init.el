; connection proxy for office environment
(when (equal system-name "DCT9R1N2")
  (setq url-proxy-services
	'(("no_proxy" . "^(localhost|127\.0\.0\.1)")
	  ("http" . "127.0.0.1:3128")
	  ("https" . "127.0.0.1:3128"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package management

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents)
  (package-install 'use-package)) ; and install one package to rule them all

(require 'use-package)

(use-package json-mode
  :ensure t
  :pin melpa-stable)

(use-package expand-region
  :ensure t
  :pin melpa-stable
  :bind (("C-M-w" . er/expand-region)
	 ("C-S-w" . er/contract-region)))

(use-package markdown-mode ; requires 'markdown' command for preview
  :ensure t
  :pin melpa-stable
  :init
  (add-hook 'markdown-mode-hook 'flyspell-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (expand-region json-mode markdown-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configuration

;; miscellaneous global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t)

;; miscellaneous buffer local variables
(setq-default
 backward-delete-char-untabify-method nil) ;; delete just one character

;; starting emacs client full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

; lose the UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; show white spaces
(global-whitespace-mode)
(setq whitespace-style
 '(face spaces trailing space-before-tab newline empty space-after-tab space-mark tab-mark newline-mark))

;; spelling - requires 'aspell' program installed
(setq ispell-program-name "aspell")
(require 'ispell)

;; Common User Access key bindings
(cua-mode t)
(transient-mark-mode 1) ; No region when it is not highlighted
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
; custom keybindings for CUA mode
;(global-set-key (kbd "C->") 'cua-scroll-up)
;(global-set-key (kbd "C-<") 'cua-scroll-down)

;; custom keybindings
; invoke M-x without the Alt key
;(global-set-key "\C-x\C-m" 'execute-extended-command)
;(global-set-key "\C-w" 'backward-kill-word)

; set theme
(load-file "~/.emacs.d/themes/default-black-theme.el")

(server-start)
