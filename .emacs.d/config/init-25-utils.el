;;; 25-utils --- Small useful functions and key bindings
;;; Commentary:
;;; Code:

;; bind-key
(use-package bind-key
  :ensure t)

;; SET BINDING FOR MODES
(progn
  ;; define a prefix keymap
  (define-prefix-command 'my-modes-key-map)
  (define-key my-modes-key-map (kbd "<f6>") 'visual-line-mode)
  (define-key my-modes-key-map (kbd "<f7>") 'linum-mode)
  (define-key my-modes-key-map (kbd "<f8>") 'whitespace-mode)
  )

(global-set-key (kbd "<f9>") my-modes-key-map)

(use-package smex
  :ensure t
  :init (progn
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)))
  
(use-package idle-highlight-mode
	     :ensure t)

(use-package flycheck-haskell
	     :ensure t)

(use-package flycheck
	     :ensure t
	     :config
	     (progn
	       (add-hook 'flycheck-mode-hook 'flycheck-haskell-setup)
	           ))

;;; Lisp
(dolist (lisp-candidate '("sbcl" "clisp"))
  (when (executable-find lisp-candidate)
    (load (expand-file-name "~/quicklisp/slime-helper.el"))
    (setq inferior-lisp-program lisp-candidate)
        ))


;;; init-25-utils.el ends here
