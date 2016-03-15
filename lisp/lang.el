;;; package --- language specific configuration
;;; Code:
;;; Commentary:

(use-package yaml-mode
  :init
  (add-hook 'yaml-mode-hook
	    '(lambda ()
	       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  :ensure t
  :defer t
  :mode ("\\.yml$" . yaml-mode)
  )

;;(use-package yaml-mode
  ;;:init
  ;;(require 'yaml-mode)
  ;;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  ;;:ensure t
  ;;:config
;;)

(provide 'lang)
;;;
