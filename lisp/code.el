;;; package --- Common coding settings
;;; Code:
;;; Commentary:

;; which-key helps to complete commands
(require 'which-key)
(which-key-mode)

;; smartparens configuration
(require 'smartparens-config)
(smartparens-global-mode 1)
(sp-use-smartparens-bindings)
(add-hook 'prog-mode-hook 'smartparens-strict-mode)

;; rainboe delimiters mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; aggresive indentation
(global-aggressive-indent-mode 1)

;;highlight indentation
(add-hook 'prog-mode-hook #'highlight-indentation-mode)
(indent-guide-global-mode)

;; company autocompletion
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(company-quickhelp-mode 1)
;;company flx fuzzy matching
(with-eval-after-load 'company
  (company-flx-mode +1))

;;yasnippet mode
(yas-global-mode 1)

(provide 'code)
;;;
