;;; package --- Common coding settings
;;; Code:
;;; Commentary:

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
)

;;indentation
(use-package indent-guide
  :ensure t
  :config
  (indent-guide-global-mode))

;;yasnippets config
(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1)
  )

;;company completion system
(use-package company
  :ensure t
  :defer t
  :config (global-company-mode))

;; Helps to identify emac key bindings to action mapping.
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

(provide 'code)
;;;
