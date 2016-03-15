;;; package --- Helm and navigation aide's
;;; Code:
;;; Commentary:
(use-package projectile
  :ensure t
  :config (projectile-global-mode)        ;; Enable projectile everywhere
)

(use-package ag
  :ensure t
)

(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (progn
    (use-package helm-projectile
      :ensure t
      :commands helm-projectile
      :init
      (helm-projectile-on)
      :config
      
    )
    (use-package helm-ag :ensure t)
    (require 'helm-config)
    (helm-mode 1)
    (helm-autoresize-mode 1)
    )
  :bind (
	 ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files))
   :config
   (setq projectile-completion-system 'helm)
   (helm-projectile-on)
  )

(use-package helm-descbinds
  :defer t
  :ensure t
  :bind (("C-h b" . helm-descbinds)
         ("C-h w" . helm-descbinds)))

(ido-mode -1) ;; Turn off ido mode in case it is enabled

(provide 'nav)
;;;
