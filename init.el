;; package --- summary
;;; Code:
;;; Commentary:
(setq user-full-name "Vijay Akkineni")
(setq user-mail-address "akkineni.vijay@gmail.com")

;; This makes my Emacs startup time ~35% faster.
(setq gc-cons-threshold 100000000)

;; Initialize the package system.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
  (require 'diminish)                ;; if you use :diminish
  (require 'bind-key)                ;; if you use any :bind variant

;; Add custom code to the load path. `ext' contains Lisp code that I didn't
;; write but that is not in melpa, while `lisp' is for List code I wrote.
(add-to-list 'load-path (expand-file-name "ext" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;Theme settings
(use-package theme)

;;Emacs visual settings
(use-package face)

;; Common coding tooling
(use-package code)

;; helm config
(use-package nav)

;; programming lang config
(use-package lang)

;;clojure configuration
(use-package clojure-setup)

;;git configuration
(use-package git)

;;markdown config
(use-package mark)

;; Only maximize the window now because doing so earlier causes weird
;; behaviours.
(when (display-graphic-p)
  (toggle-frame-maximized))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "rdiscount"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
