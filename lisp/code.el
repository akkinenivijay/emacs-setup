;;; package --- Common coding settings
;;; Code:
;;; Commentary:
(show-paren-mode)           ; Automatically highlight parenthesis pairs
(setq show-paren-delay 0) ; show the paren match immediately

;;smart parenthesis config
(use-package smartparens
  :ensure t
  :init
  (require 'smartparens-config)
  :config
  (add-hook 'prog-mode-hook #'smartparens-strict-mode)
  (add-hook 'yaml-mode-hook #'smartparens-mode)
)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
)

;;indentation
(use-package indent-guide
  :ensure t
  :config
  (add-hook 'prog-mode-hook (lambda () (indent-guide-mode)))
)

;;flycheck configuration
(use-package flycheck
  :ensure t
  :init
  (add-hook 'prog-mode-hook (lambda () (flycheck-mode)))
  )

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
    ;;(define-key company-mode-map (kbd "C-SPC") 'helm-company)
    ;;(define-key company-active-map (kbd "C-SPC") 'helm-company)
    )
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'prog-mode-hook 'company-mode)
  (setq company-idle-delay nil)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
  (progn
  ;; Company mode interferes with yasnippets, so this fixes it and integrates them:
  ;; http://emacs.stackexchange.com/questions/10431/get-company-to-show-suggestions-for-yasnippet-names
  ;; Add yasnippet support for all company backends
  ;; https://github.com/syl20bnr/spacemacs/pull/179
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")

  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))

  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))))

(provide 'code)
;;;
