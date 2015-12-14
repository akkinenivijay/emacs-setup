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
    flx-ido
    color-theme
    cider
    zenburn-theme
    solarized-theme
    leuven-theme
    color-theme-sanityinc-tomorrow
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
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-hook 'after-init-hook 'global-company-mode)
(load "init-smartparens")
(load "setup-clojure")
(load "theme")
(load "ido")
(load "editing")

(require 'helm)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)
