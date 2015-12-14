;; To make TAB complete, without losing the ability to manually indent, you can add this to your config:
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;
;; Clojure Settings
;;
(require 'clojure-mode-extra-font-locking)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

; syntax highlighting for midje
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))

(setq nrepl-log-messages nil)
(setq nrepl-hide-special-buffers t)

(setq cider-overlays-use-font-lock t)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect nil)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Prevent C-c C-k from prompting to save the file corresponding to the buffer being loaded,
(setq cider-prompt-save-file-on-load nil)

;; Change the result prefix for interactive evaluation (by default it's =>):
(setq cider-interactive-eval-result-prefix ";; => ")

;; CIDER can syntax highlight symbols that are known to be defined.
(setq cider-font-lock-dynamically '(macro core function var))

;; cider-pprint-fn can be set to the namespace-qualified name of a Clojure
;; function that takes a single argument and will pretty-print the value of said argument to *out*
(setq cider-pprint-fn "fipp.edn/pprint")

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable smartparens in your REPL
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))


;; key bindings
;; these help me out with the way I usually develop web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))
