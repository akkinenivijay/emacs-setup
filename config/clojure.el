;;; clojure --- clojure mode configuration
;;; Code:
;;; Commentary: 

(defun my/clojure-mode-hook ()
  "Set up clojure mode"
  (eldoc-mode 1)
  (company-mode t)
  (subword-mode t)
  (smartparens-strict-mode t)
  (rainbow-delimiters-mode t)
  (setq font-lock-verbose nil)
  (global-set-key (kbd "C-c t") 'clojure-jump-between-tests-and-code)
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m")
  )

(use-package clj-refactor)
(use-package clojure-mode-extra-font-locking)

(use-package clojure-mode
  :init
  :config
  (require 'clojure-mode-extra-font-locking)
  (require 'clj-refactor)
  (progn
    (add-hook 'clojure-mode-hook 'my/clojure-mode-hook)))

(defun my/setup-cider ()
  (lambda ()
    (setq cider-repl-history-file "~/.nrepl-history"
	  nrepl-hide-special-buffers t
	  cider-repl-history-size 10000
	  cider-prefer-local-resources t
	  cider-test-show-report-on-success t
	  cider-show-error-buffer 'only-in-repl
	  cider-overlays-use-font-lock t
	  cider-repl-wrap-history t
	  cider-repl-result-prefix ";; =>"
	  nrepl-buffer-name-show-port t
	  cider-repl-shortcut-dispatch-char ?\:
	  nrepl-buffer-name-separator "-")
    (smartparens-strict-mode 1)
    (company-mode 1)
    (rainbow-delimiters-mode 1)
    (eldoc-mode 1)))

(use-package cider
  :init
  (progn
    (add-hook 'cider-mode-hook 'my/setup-cider)
    (add-hook 'cider-repl-mode-hook 'my/setup-cider)
    (add-hook 'cider-mode-hook 'my/clojure-mode-hook)
    (add-hook 'cider-repl-mode-hook 'my/clojure-mode-hook)))


(provide 'clojure)
;;;
