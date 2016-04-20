;;; package --- visual configuration of emacs
;;; Code:
;;; Commentary:
(setq make-backup-files nil)

;; disables the scratch message
(setq initial-scratch-message nil
      inhibit-startup-message t)

(set-frame-font "DroidSans-16")
;;(menu-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)
;;(setq confirm-kill-emacs 'y-or-n-p)

(use-package smart-mode-line
  :ensure t
  :config
  (progn
    (setq sml/no-confirm-load-theme t)
    (sml/setup)
  )
)

(use-package fortune-cookie
  :ensure t
  :config
  (setq fortune-cookie-cowsay-enable nil) ; Disable cowsay
  (fortune-cookie-mode)                   ; Enable fortune cookie mode
)

(provide 'face)
