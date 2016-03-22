;;; package --- Clojure configuration
;;; Code:
;;; Commentary:

(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
	 ("\\.mdwn\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode)))

(provide 'mark)
;;;
