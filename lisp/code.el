;;; package --- Common coding settings
;;; Code:
;;; Commentary:

(use-package smartparens
  :ensure t
  :init
  (require 'smartparens-config)
  :config
  (smartparens-global-mode 1))

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
  :init
  (setq company-idle-delay 0.5)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-flip-when-above t)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'prog-mode-hook 'company-mode)
  (setq company-idle-delay nil)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))

;; Helps to identify emac key bindings to action mapping.
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

(provide 'code)
;;;
