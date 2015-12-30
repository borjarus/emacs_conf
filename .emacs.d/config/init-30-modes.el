;;; 30-modes --- Major modes
;;; Commentary:
;;; Code:

;; Prepare various major modes

(use-package haskell-mode
  :ensure t
  :mode "\\.hs\\'")

(use-package haskell-mode
	     :ensure t
	     :mode "\\.hs\\'"
	     :commands haskell-mode
	     :config (progn
		       (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
		       (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
		       (custom-set-variables '(haskell-process-type 'cabal-repl))
		       (setq-default ghc-display-error 'other-buffer)
		       (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
		       (add-hook 'haskell-mode-hook 'flycheck-haskell-setup)
		       (add-hook 'haskell-mode-hook 'flycheck-mode)
					; (add-hook 'haskell-mode-hook 'ghc-init)
		       ;;(add-hook 'haskell-mode-hook 'company-mode)
		       (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
		       ))

(use-package haskell-interactive-mode
	       :commands haskell-interactive-mode)


(use-package python
  :mode ("\\.py'" . python-mode)
  :init
  (progn
    (defalias 'python2-mode 'python-mode)
    (defalias 'python3-mode 'python-mode)))

(use-package hy-mode
  :ensure t
  :mode "\\.hy\\'")

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :interpreter "node")


(use-package actionscript-mode
  :ensure t
  :mode "\\.as\'")

(use-package php-mode
  :ensure t
  :mode "\\.php[345]?\\'")

(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")

(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
  	 ("\\.mdwn\\'" . markdown-mode)
  	 ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "~/.config/emacs/markdown"))

(use-package erlang
  :ensure t
  :mode "\\.[eh]rl\\'")

(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'"
  :init
  (setq scss-compile-at-save nil))

(use-package haml-mode
  :ensure t
  :mode "\\.haml\\'")

(use-package cmake-mode
  :mode (("/CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)))

(use-package pkgbuild-mode
  :ensure t
  :mode "/PKGBUILD\\'")

(use-package dockerfile-mode
  :ensure t
  :mode "/Dockerfile\\'")

(use-package puppet-mode
  :ensure t
  :mode "\\.pp\\'")

(use-package gnuplot
  :mode "\\.gp\\'\\|\\.plot\\'"
  :commands gnuplot-make-buffer)

(use-package graphviz-dot-mode
  :ensure t
  :mode "\\.dot\\'")

(use-package po-mode
  :mode "\\.pot?\\'")
(use-package po-compat
  :commands po-find-file-coding-system
  :init
  (modify-coding-system-alist 'file "\\.po\\'\\|\\.po\\." 'po-find-file-coding-system))

(use-package systemd
  :ensure t
  :mode ("\\.automount\\'\\|\\.busname\\'\\|\\.mount\\'\\|\\.service\\'\\|\\.slice\\'\\|\\.socket\\'\\|\\.target\\'\\|\\.timer\\'\\|\\.link\\'\\|\\.netdev\\'\\|\\.network\\'\\|\\.override\\.conf.*\\'" . systemd-mode))


(use-package clojure-mode
	     :ensure t
	     :mode (("\\.clj\\'" . clojure-mode)
		    ("\\.edn\\'" . clojure-mode))
	     :init
	     (add-hook 'clojure-mode-hook #'yas-minor-mode)
	     (add-hook 'clojure-mode-hook #'linum-mode)
	     (add-hook 'clojure-mode-hook #'subword-mode)
	     (add-hook 'clojure-mode-hook #'smartparens-mode)
	     (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
	     (add-hook 'clojure-mode-hook #'eldoc-mode)
	       (add-hook 'clojure-mode-hook #'idle-highlight-mode))

;; -----------------------------------------------------------------------------
;; Minor modes
;; -----------------------------------------------------------------------------

;; HideShow minor mode for common major modes
;(dolist (hook '(c-mode-common-hook emacs-lisp-mode-hook java-mode-hook lisp-mode-hook
;		lua-mode perl-mode-hook python-mode-hook sh-mode-hook))
;  (add-hook hook 'hs-minor-mode))

;; smerge-mode, as suggested in the doc
(use-package smerge-mode
  :commands smerge-mode
  :init
  (progn
    (setq smerge-command-prefix (kbd "C-c '")))

    (defun sm-try-smerge ()
      (save-excursion
	(goto-char (point-min))
	(when (re-search-forward "^<<<<<<< " nil t)
	  (smerge-mode 1))))
    (add-hook 'find-file-hook 'sm-try-smerge)
    (add-hook 'after-revert-hook 'sm-try-smerge))

;; geiser, for Scheme REPL and autodoc
(use-package geiser
	     :ensure t)


;; CIDER
(use-package cider-eval-sexp-fu
	     :defer t)

(use-package clj-refactor
	     :defer t
	     :ensure t
	     :diminish clj-refactor-mode
	       :config (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package cider
	     :ensure t
	     :defer t
	     :init (add-hook 'cider-mode-hook #'clj-refactor-mode)
	     :diminish subword-mode
	     :config
	     (setq nrepl-log-messages t
		   cider-repl-display-in-current-window t
		   cider-repl-use-clojure-font-lock t
		   cider-prompt-save-file-on-load 'always-save
		   cider-font-lock-dynamically '(macro core function var)
		   nrepl-hide-special-buffers t
		   cider-overlays-use-font-lock t)
	     (cider-repl-toggle-pretty-printing))


;; SLIME
(use-package slime
	     :ensure t
	     :commands slime
	     :config

	     (progn
	       (add-hook
		'slime-load-hook
		#'(lambda ()
		    (slime-setup
		     '(slime-fancy
		       slime-media
		       slime-repl
		       slime-asdf
		       slime-fuzzy
		       slime-tramp))))
	       (setq slime-net-coding-system 'utf-8-unix)

	       ;; Slime and Auto-Complete
	       ;(use-package ac-slime
		;	    :load-path (expand-site-lisp "ac-slime")
		;	    :init
		;	    (progn
		;	      (add-hook 'slime-mode-hook 'set-up-slime-ac)
		;	      (add-hook 'slime-repl-mode-hook 'set-up-slime-ac))
		;	    :config
		;	    (progn
		;	      (eval-after-load "auto-complete"
		;		'(add-to-list 'ac-modes 'slime-repl-mode))))
	       ))

;; eldoc-mode
;(dolist (hook '(emacs-lisp-mode-hook lisp-mode-hook python-mode-hook))
;  (add-hook hook 'eldoc-mode))

;;; init-30-modes.el ends here
