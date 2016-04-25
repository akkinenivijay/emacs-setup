;;; package --- Common coding settings
;;; Code:
;;; Commentary:

;; Basic settings

(use-package auctex-latexmk
  :defer t
  :init
  (add-hook 'LaTeX-mode-hook 'auctex-latexmk-setup))

(use-package company-auctex
  :defer t
  :init
  (add-hook 'LaTeX-mode-hook 'company-auctex-init))

(use-package tex
  :defer t
  :init
  (setq TeX-auto-save t
	TeX-parse-self t
	TeX-syntactic-comment t
	TeX-PDF-mode t
	;; Synctex support
	TeX-source-correlate-mode t
	TeX-source-correlate-start-server nil
	;; Setup reftex style (RefTeX is supported through extension)
	reftex-use-fonts t
	;; Don't insert line-break at inline math
	LaTeX-fill-break-at-separators nil)
  (defvar latex-nofill-env '("equation"
			     "equation*"
			     "align"
			     "align*"
			     "tabular"
			     "tikzpicture")
    "List of environment names in which `auto-fill-mode' will be inhibited.")
  (add-hook 'LaTeX-mode-hook 'latex/auto-fill-mode)
  (add-hook 'LaTeX-mode-hook 'latex-math-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  ;; (add-hook 'LaTeX-mode-hook 'my/latex-mode-defaults)

  :config
  ;; (defun my/latex-mode-defaults ()
  ;;   (visual-line-mode +1)
  ;;   (yas-minor-mode -1))

  (defun latex//autofill ()
        "Check whether the pointer is ucrrently inside on the
environments described in `latex-nofill-env' and if so, inhibits
the automatic filling of the current paragraph."
	(let ((do-auto-fill t)
	      (current-environment """")
	      (level 0))
	  (while (and do-auto-fill (not (string= current-environment "document")))
	    (setq level (1+ level)
		  current-environment (LaTeX-current-environment level)
		  do-auto-fill (not (member current-environment latex-nofill-env))))
	  (when do-auto-fill
	    (do-auto-fill))))

  (defun latex/auto-fill-mode ()
    "Toggle uato-fill-mode using the custom auto-fill function."
    (interactive)
    (auto-fill-mode)
    (setq auto-fill-function 'latex//autofill))

  ;; (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
  ;; (add-to-list 'auto-mode-alist '("\\.l[gh]s\\'" . tex-mode))

  (when (eq system-type 'darwin)
    (setq TeX-view-program-selection
	  '((output-dvi "DVI Viewer")
	    (output-pdf "PDF Viewer")
	    (output-html "HTML Viewer")))

    (setq TeX-view-program-list
	  '(("DVI Viewer" "open %o")
	    ("PDF Viewer" "open %o")
	                ("HTML Viewer" "open %o")))))

(provide 'ltx)
;;;
