;;; package --- Common coding settings
;;; Code:
;;; Commentary:
(show-paren-mode)           ; Automatically highlight parenthesis pairs
(setq show-paren-delay 0) ; show the paren match immediately

;;smart parenthesis config
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'prog-mode-hook #'smartparens-strict-mode)
  (progn
      (show-smartparens-global-mode t))
)

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

;;flycheck configuration
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  )
(add-hook 'after-init-hook #'global-flycheck-mode)

;;yasnippets config
(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1)
  )

;;company completion system
(use-package company
  :ensure t
  :init
  (use-package helm-company
    :ensure t
    :config
    (define-key company-mode-map (kbd "C-:") 'helm-company)
    (define-key company-active-map (kbd "C-:") 'helm-company)
    )
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'prog-mode-hook 'company-mode)
  (setq company-idle-delay nil)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))

(provide 'code)
;;;
