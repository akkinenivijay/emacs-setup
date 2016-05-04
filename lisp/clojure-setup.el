;;; package --- Clojure configuration
;;; Code:
;;; Commentary:

(use-package slamhound
  :ensure t)

(use-package color-identifiers-mode
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-color-identifiers-mode)
  )

(use-package aggressive-indent :ensure t :defer t)

(defun clj-refactor-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c .")
  )

(use-package clojure-mode
  :ensure t
  :init
    (use-package clj-refactor
      :ensure t
      :diminish clj-refactor-mode)
    (defconst clojure--prettify-symbols-alist
    '(("fn"   . ?λ)
      ("__"   . ?⁈)))
  :config
    (add-hook 'clojure-mode-hook 'global-prettify-symbols-mode)
    (add-hook 'clojure-mode-hook #'clj-refactor-hook)
    (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
    (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
    (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
)

(defun cider-send-and-evaluate-sexp ()
  "Sends the s-expression located before the point or the active
  region to the REPL and evaluates it. Then the Clojure buffer is
  activated as if nothing happened."
  (interactive)
  (if (not (region-active-p))
      (cider-insert-last-sexp-in-repl)
    (cider-insert-in-repl
     (buffer-substring (region-beginning) (region-end)) nil))
  (cider-switch-to-repl-buffer)
  (cider-repl-closing-return)
  (cider-switch-to-last-clojure-buffer)
  (message ""))

(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!)
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))

(use-package cider
  :ensure t
  :init
  (progn
    (use-package cider-eval-sexp-fu :ensure t)
    (require 'cider-eval-sexp-fu)
    (setq cider-repl-shortcut-dispatch-char ?\:)
    (setq cider-repl-result-prefix "===>")
    (setq nrepl-buffer-name-separator "-")
    (setq nrepl-buffer-name-show-port t)
    (setq cider-repl-wrap-history t)
    (setq cider-repl-history-size 1000)
    (setq nrepl-log-messages nil)
    (setq cider-test-show-report-on-success t)
    (setq cider-stacktrace-fill-column 80)
    (setq cider-stacktrace-default-filters '(tooling dup))
    (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
    (add-hook 'cider-repl-mode-hook #'eldoc-mode)
    (add-hook 'cider-mode-hook #'eldoc-mode)
    (add-hook 'cider-repl-mode-hook #'company-mode)
    (add-hook 'cider-mode-hook #'company-mode)
    (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
    (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
    (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
    (bind-key "C-c C-v" 'cider-send-and-evaluate-sexp)
    (bind-key "C-c C-f" 'cider-figwheel-repl)
    )
  :config
  (use-package slamhound)
  )

(provide 'clojure-setup)
;;;
