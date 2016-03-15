;;; package --- git configuration
;;; Code:
;;; Commentary:

(use-package git-gutter
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'git-gutter-mode)
  (global-git-gutter-mode +1))

(provide 'git)
;;;
