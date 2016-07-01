;;; package --- visual configuration of emacs
;;; Code:
;;; Commentary:
(setq make-backup-files nil)
(setq auto-save-default nil)

;; disables the scratch message
(setq initial-scratch-message nil
      inhibit-startup-message t)

(show-paren-mode 1)

(set-frame-font "mononoki-16")
(set-background-color "#282a36")
;;(menu-bar-mode -1)
;;(defalias 'yes-or-no-p 'y-or-n-p)
;;(setq confirm-kill-emacs 'y-or-n-p)

(provide 'face)
