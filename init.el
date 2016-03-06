;;; package --- summary
;;; Code:
;;; Commentary:
(setq user-full-name "Vijay Akkineni")
(setq user-mail-address "akkineni.vijay@gmail.com")

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(when (< emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("gnu" . "http://elpa.gnu.org/packages/")
   t)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(load-file "~/.emacs.d/config/face.el")
(load-file "~/.emacs.d/config/helm.el")
(load-file "~/.emacs.d/config/code-comp.el")
(load-file "~/.emacs.d/config/parens.el")
(load-file "~/.emacs.d/config/clojure.el")

(provide 'init)
;;;


