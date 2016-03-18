;;; package --- Clojure configuration
;;; Code:
;;; Commentary:

(defun clj-refactor-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m")
  )

(use-package clojure-mode
  :ensure t
  :init
  (progn
    (use-package clojure-mode-extra-font-locking
      :ensure t
      )
    (use-package clj-refactor
      :ensure t
      )
    (require 'clojure-mode-extra-font-locking)
    (require 'clj-refactor)
    (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
    (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
    (add-hook 'clojure-mode-hook #'clj-refactor-hook)))

(use-package cider
  :ensure t
  :init
  (progn
    (use-package cider-eval-sexp-fu
      :ensure t
      )
    (add-hook 'cider-repl-mode-hook #'eldoc-mode)
    (add-hook 'cider-mode-hook #'eldoc-mode)
    (add-hook 'cider-repl-mode-hook #'company-mode)
    (add-hook 'cider-mode-hook #'company-mode)
    (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
    (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
    (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
    (require 'cider-eval-sexp-fu))
  :config
  (setq cider-repl-shortcut-dispatch-char ?\:)
  (setq cider-repl-result-prefix ";; => ")
  (setq nrepl-buffer-name-separator "-")
  (setq nrepl-buffer-name-show-port t)
  (setq cider-repl-wrap-history t)
  (setq cider-repl-history-size 1000)
  (setq nrepl-log-messages nil)
  (setq cider-test-show-report-on-success t)
  (setq cider-stacktrace-fill-column 80)
  (setq cider-stacktrace-default-filters '(tooling dup)))

(provide 'clojure-setup)
;;;
