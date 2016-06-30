;; package --- summary
;;; Code:
;;; Commentary:
(setq user-full-name "Vijay Akkineni")
(setq user-mail-address "akkineni.vijay@gmail.com")

;; This makes my Emacs startup time ~35% faster.
(setq gc-cons-threshold 20000000)

(require 'package) 
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Add custom code to the load path. `ext' contains Lisp code that I didn't
;; write but that is not in melpa, while `lisp' is for List code I wrote.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path (expand-file-name "ext" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; list the packages you want
(setq package-list 
	'(ido smex ido-ubiquitous flx-ido projectile 
		smartparens which-key rainbow-delimiters 
		aggressive-indent highlight-indentation indent-guide
		company yasnippet
		clojure-mode clojure-mode-extra-font-locking clj-refactor cider))


; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(load "theme")
(load "face")
(load "nav")
(load "code")
(load "clj-setup")

; ;; programming lang config
; (use-package lang)

; ;;clojure configuration
; (use-package clojure-setup)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (which-key smartparens smex projectile ido-ubiquitous flx-ido))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
