;; package managment
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
; '(package-selected-packages
;   (quote
;    (neotree fold-this expand-region intero json-mode markdown-mode)))
 )

(custom-set-faces)

;; miscellaneous global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t)

;; miscellaneous buffer local variables
(setq-default
 indent-tabs-mode t
 backward-delete-char-untabify-method nil ;; delete just one character
 tab-width 4
 c-basic-offset 4)

;; connection proxy for office environment
(setq url-proxy-services
 '(("no_proxy" . "^(localhost|127\.0\.0\.1)")
  ("http" . "127.0.0.1:3128")
  ("https" . "127.0.0.1:3128")))

;; show line numbers
;(global-linum-mode t)

;; show white spaces
(global-whitespace-mode)
(setq whitespace-style
 '(face spaces trailing space-before-tab newline empty space-after-tab space-mark tab-mark newline-mark))

;; starting emacs client full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; spelling - requires 'aspell' program installed
;;(setq ispell-program-name "aspell")
;;(require 'ispell)

;; expand selection
;;(require 'expand-region)
;;(global-set-key (kbd "C-M-w") 'er/expand-region)

;; Common User Access key bindings
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
;;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;(setq explicit-shell-file-name
;      "C:/Program Files/Git/bin/bash.exe")
;(setq shell-file-name explicit-shell-file-name)
;(add-to-list 'exec-path "C:/Program Files/Git/bin")

(add-hook 'comint-output-filter-functions
    'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
    'comint-watch-for-password-prompt nil t)
(setq explicit-shell-file-name "bash.exe")
;; For subprocesses invoked via the shell
;; (e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)


(server-start)
