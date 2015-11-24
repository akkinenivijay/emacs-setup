(require 'smartparens-config)
(smartparens-global-mode t)

(define-key smartparens-mode-map (kbd "C-r") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-l") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-M-l") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-r") 'sp-backward-barf-sexp)

