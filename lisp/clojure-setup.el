;;; package --- Clojure configuration
;;; Code:
;;; Commentary:

(use-package aggressive-indent :ensure t
  :config
    (global-aggressive-indent-mode 1)
  :defer t)

(defun clj-refactor-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package clojure-mode
  :ensure t
  :init
    (use-package clj-refactor
      :ensure t
      :diminish clj-refactor-mode)
  :config
    (add-hook 'clojure-mode-hook 'global-prettify-symbols-mode)
    (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
    (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
    (add-hook 'clojure-mode-hook #'subword-mode)
    (add-hook 'clojure-mode-hook #'clj-refactor-hook)
    (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
)

(use-package cider
  :ensure t
  :defer t)

(provide 'clojure-setup)
;;;
