(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'text-mode)

;; spacemacs-theme
(use-package material-theme
  :ensure t
  :config (load-theme 'material t))

(custom-set-faces '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "nil" :family "Inconsolata")))))

(setq make-backup-files nil)

(if window-system (scroll-bar-mode -1))
(menu-bar-mode -1)

