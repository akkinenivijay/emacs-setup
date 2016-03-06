
;; == web-mode ==
(use-package web-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml?\\'" . web-mode))
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))

  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq indent-tabs-mode nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-enable-current-element-highlight t)
    )
  (add-hook 'web-mode-hook  'my-web-mode-hook)

  )

;; == emmet ==
(use-package emmet-mode
  :ensure t
  :defer t
  :diminish emmet-mode
  :init
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
  (add-hook 'web-mode-hook 'emmet-mode)
  )
