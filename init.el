(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(better-defaults
    smartparens
    projectile
    company
    clojure-mode
    clojure-mode-extra-font-locking
    smex
    markdown-mode
    rainbow-delimiters
    dash
    helm-core
    gitignore-mode
    yaml-mode
    ido-ubiquitous
    color-theme
    cider
    zenburn-theme
    leuven-theme
    magit
    )
  )

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p))
  )

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq user-full-name "Vijay Akkineni"
      user-mail-address "vijay.akkineni@weather.com")

(add-to-list 'load-path "~/.emacs.d/vijaycust")
(global-company-mode)
(load "init-smartparens")
(load "setup-clojure.el")
(load "theme.el")
(load "ido.el")
(load "editing.el")

(require 'helm)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f5eb916f6bd4e743206913e6f28051249de8ccfd070eae47b5bde31ee813d55f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
