;;; Code --- Summary
;;; Code: 
;;; Commentary: 

;; == rainbow-delimiters ==
(use-package rainbow-delimiters
  :ensure t
  :diminish rainbow-delimiters-mode
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package company
  :ensure t
  :init
  (use-package helm-company
    :ensure t
    :config
    (define-key company-mode-map (kbd "C-SPC") 'helm-company)
    (define-key company-active-map (kbd "C-SPC") 'helm-company)
    )
  :config
  (add-hook 'prog-mode-hook 'company-mode)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
  (global-company-mode)
  (progn
    (defvar company-mode/enable-yas t
      "Enable yasnippet for all backends.")

    (defun company-mode/backend-with-yas (backend)
      (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
	  backend
	(append (if (consp backend) backend (list backend))
		'(:with company-yasnippet))))

    (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))))

;; === Tools ===

;; == Projectile ==
(use-package projectile
  :ensure t
  :defer t
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (use-package helm-projectile
    :ensure t
    :init
    (helm-projectile-on)
    ))

;; == magit ==
(use-package magit
  :ensure t
  :defer t
  :bind ("C-x g" . magit-status)
  :init
  (setq magit-diff-options (quote ("--word-diff")))
  (setq magit-diff-refine-hunk 'all)
  )

;; == flycheck ==
(use-package flycheck
  :ensure t
  :defer t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; check OS type
  (if (string-equal system-type "gnu/linux")
      (progn
	(custom-set-variables
	 '(flycheck-c/c++-clang-executable "clang-3.5")
	 )))
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11"))))

(provide 'code-comp)
;;;
    
