;;; package --- Helm and navigation aide's
;;; Code:
;;; Commentary:

(defun mkdir-p (dir-path)
  (unless (file-exists-p dir-path)
    (make-directory dir-path t)))

(defcustom ers-projectile-folder "~/.emacs.d/data/projectile"
  "Projectile folder."
  :type 'directory
  :group 'emacs-rimero-setup)

(defcustom ers-projectile-cache-filename "projectile.cache"
  "Projectile Cache filename"
  :type 'string
  :group 'emacs-rimero-setup)

(defcustom ers-projectile-bookmarks-filename "projectile-bookmarks.eld"
  "Projectile Bookmarks filename"
  :type 'string
  :group 'emacs-rimero-setup)

(use-package projectile
  :ensure    projectile
  :config    (projectile-global-mode t)
  :init      (progn
               ;; create projectile data folder if non-existent
               (mkdir-p ers-projectile-folder)

               ;; set projectile custom variables
               (let* ((ers-projectile-dir (file-name-as-directory ers-projectile-folder))
                      (ers-projectile-cache-file (concat ers-projectile-dir ers-projectile-cache-filename))
                      (ers-projectile-bookmarks-file (concat ers-projectile-dir ers-projectile-bookmarks-filename)))
                 (setq projectile-cache-file          ers-projectile-cache-file
                       projectile-known-projects-file ers-projectile-bookmarks-file
                       projectile-indexing-method     'alien
                       projectile-enable-caching      t)))
  :diminish   projectile-mode)

(use-package ido
  :ensure t
  :config
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10
        ido-default-file-method 'selected-window
        ido-auto-merge-work-directories-length -1)
  (ido-mode +1))

(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode +1))

(use-package flx-ido
  :ensure t
  :init
  :config
  (setq ido-use-faces nil)
  (flx-ido-mode +1))

  (use-package smex
    :ensure t
    :init
    (smex-initialize)
    :config
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(provide 'nav)
;;;
