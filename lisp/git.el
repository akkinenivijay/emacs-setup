;;; package --- git configuration
;;; Code:
;;; Commentary:

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package git-gutter
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'git-gutter-mode)
  (global-git-gutter-mode +1))

(provide 'git)
;;;
