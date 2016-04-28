;;; package --- Common coding settings
;;; Code:
;;; Commentary:
(show-paren-mode)           ; Automatically highlight parenthesis pairs
(setq show-paren-delay 0) ; show the paren match immediately

;;smart parenthesis config
(use-package smartparens-config
  :ensure smartparens
  :config
  (progn
    (sp-use-smartparens-bindings)
    (smartparens-global-mode)
    (show-smartparens-global-mode)
    )
  (add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'cider-repl-mode-hook #'turn-on-smartparens-strict-mode)
  (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)
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

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

(provide 'code)
;;;
