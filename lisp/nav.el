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

  (use-package ido
    :ensure t
    :config
    (setq ido-enable-prefix nil
          ido-enable-flex-matching t
          ido-create-new-buffer 'always
          ido-use-filename-at-point 'guess
          ido-max-prospects 10
          ido-default-file-method 'selected-window
          ido-auto-merge-work-directories-length -1)
    (ido-mode +1))

  (use-package ido-ubiquitous
    :ensure t
    :config
    (ido-ubiquitous-mode +1))

  (use-package flx-ido
    :ensure t
    :config
    (flx-ido-mode +1)
    ;; disable ido faces to see flx highlights
    (setq ido-use-faces nil))

(provide 'nav)
;;;
