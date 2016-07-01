;;; package --- Helm and navigation aide's
;;; Code:
;;; Commentary:

(defun mkdir-p (dir-path)
  (unless (file-exists-p dir-path)
    (make-directory dir-path t)))

(defcustom my-projectile-folder "~/.emacs.d/data/projectile"
  "Projectile folder."
  :type 'directory
  :group 'emacs-vijay-setup)

(defcustom my-projectile-cache-filename "projectile.cache"
  "Projectile Cache filename"
  :type 'string
  :group 'emacs-vijay-setup)

(defcustom my-projectile-bookmarks-filename "projectile-bookmarks.eld"
  "Projectile Bookmarks filename"
  :type 'string
  :group 'emacs-vijay-setup)

;; IDO Mode
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)

;; SMEX Config
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ido-ubiquitous
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;;flx-ido
(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'projectile)
(projectile-global-mode)
;;(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(provide 'nav)
;;;