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

(provide 'lang)
;;;
