;;; package --- Helm and navigation aide's
;;; Code:
;;; Commentary:
(use-package projectile
  :diminish projectile-mode
  :ensure t
  :config
  (projectile-global-mode)        ;; Enable projectile everywhere
  (setq projectile-indexing-method 'alien)
)

(use-package ag
  :ensure t
  )

(use-package helm-config
  :config
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match    t)
  (progn
    (helm-mode 1)
    (helm-adaptive-mode 1)
    (helm-autoresize-mode 1)
    (helm-push-mark-mode 1))
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x C-d" . helm-browse-project)))

(use-package helm-ag
  :ensure t)

(use-package helm-ls-git
  :ensure t)

(use-package helm-projectile
  :ensure t
  :commands helm-projectile
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  )

(use-package helm-descbinds
  :defer t
  :ensure t
  :config
  (helm-descbinds-mode)
  :bind
    ("C-h b" . helm-descbinds)
    )

(ido-mode -1) ;; Turn off ido mode in case it is enabled

(provide 'nav)
;;;
