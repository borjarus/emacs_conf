;;; 25-utils --- Small useful functions and key bindings
;;; Commentary:
;;; Code:

;; bind-key
(use-package bind-key
  :ensure t)

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
;;; init-25-utils.el ends here
