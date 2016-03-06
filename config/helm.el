(use-package helm
  :ensure t
  :diminish helm-mode
  :init

  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  ;; Supress Warnings!!
  (setq ad-redefinition-action 'accept)

  :config

  (require 'helm-config)
  (bind-key "<tab>" 'helm-execute-persistent-action helm-map)
  (bind-key "C-i" 'helm-execute-persistent-action helm-map)
  (bind-key "C-z" 'helm-select-action helm-map)

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (setq helm-move-line-cycle-in-source t
	helm-ff-search-library-in-sexp        t
	helm-scroll-amount                    8
	helm-M-x-fuzzy-match                  t
	helm-ff-file-name-history-use-recentf t)
 
  (helm-mode 1)

  :bind (("C-x b" . helm-mini)
	 ("C-x C-f" . helm-find-files)
	 ("M-x" . helm-M-x)
	 )
  )
