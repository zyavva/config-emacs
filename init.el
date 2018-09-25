;;; package management

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available
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
  :bind (
     ("M-@" . er/expand-region)
     ("C-S-w" . er/contract-region)))

(use-package markdown-mode ; requires 'markdown' command for preview
  :ensure t
  :pin melpa-stable
  :init
  (add-hook 'markdown-mode-hook 'flyspell-mode))

(use-package exec-path-from-shell
  :ensure t
  :pin melpa-stable)

;;; configuration

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
 '(whitespace-space ((t (:foreground "darkgray"))))) ; override space background colour in whitespace mode

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

;; lose the UI
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

;; use Common User Access features without using its key bindings
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; disable the overriding of standard Emacs binding by CUA mode
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands

;; custom keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command) ; invoke M-x without the Alt key
(when (eq system-type 'darwin) ;; mac specific settings
;  (setq mac-option-modifier 'alt)
;  (setq mac-command-modifier 'meta)
  (setq mac-right-option-modifier 'none)
  (global-set-key [kp-delete] 'delete-char)) ;; sets fn-delete to be right-delete
(add-hook 'term-mode-hook
  (lambda ()
    (define-key term-raw-map (kbd "s-v") 'term-paste)))

(exec-path-from-shell-initialize) ; sets $MANPATH, $PATH and exec-path from shell

;;; built-in modes configutarions

;; dired
(require 'dired )
; kill current dired buffer when changing director
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))
(setq dired-dwim-target t) ; copy from one dired dir to the next dired dir shown in a split window
; (add-hook 'dired-load-hook (function (lambda () (load "dired-x")))) ; hints with commands on '!'
(defun xah-open-in-external-app ()
  "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2016-10-15"
  (interactive)
  (let* (
         ($file-list
          (if (string-equal major-mode "dired-mode")
              (dired-get-marked-files)
            (list (buffer-file-name))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" $fpath t t))) $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))

; (server-start)
(put 'dired-find-alternate-file 'disabled nil)
