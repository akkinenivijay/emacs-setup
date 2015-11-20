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
    paredit
    projectile
    clojure-mode
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

(setq user-full-name "Vijay Akkineni"
      user-mail-address "vijay.akkineni@weather.com")

(add-to-list 'load-path "~/.emacs.d/vijaycust")
(load "setup-clojure.el")
(load "theme.el")

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
