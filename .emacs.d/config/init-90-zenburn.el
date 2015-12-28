;;; 90-zenburn --- Zenburn color theme
;;; Commentary:
;;; Code:

(use-package color-theme
  :ensure t)
(use-package zenburn-theme
  :ensure t
  :init
  (progn
    (load-theme 'zenburn t)

    (zenburn-with-color-variables
      ;; Org-mode keywords
      (eval-after-load 'org
	`(progn
	   (setq org-todo-keyword-faces
		 '(("STARTED"   . "#8cd0d3") ; zenburn-blue
		   ("WIP"       . "#8cd0d3") ; zenburn-blue

		   ("PROPOSÉ"   . "#7f9f7f") ; zenburn-green
		   ("READY"     . "#7f9f7f") ; zenburn-green

		   ("ABANDONNÉ" . "#7f7f7f") ; zenburn-bg+4
		   ("CANCELED"  . "#7f7f7f") ; zenburn-bg+4
		   ("DÉLÉGUÉ"   . "#7f7f7f") ; zenburn-bg+4
		   ("N/A"       . "#7f7f7f") ; zenburn-bg+4
		   ("REFUSÉ"    . "#7f7f7f") ; zenburn-bg+4
		   )

		 org-priority-faces
		 '((?A . (:foreground ,zenburn-yellow   :weight bold)) ; zenburn-yellow
		   (?B . (:foreground ,zenburn-yellow-1 :weight bold)) ; zenburn-yellow-1
		   (?C . (:foreground ,zenburn-yellow-2))              ; zenburn-yellow-2
		   (?D . (:foreground "#c0af7f"))                      ; zenburn-yellow-3
		   (?E . (:foreground "#b09f6f"))                      ; zenburn-yellow-4
		   ))))

      ;; diff and magit-diff
      (eval-after-load 'diff-mode
	'(progn
	   (set-face-foreground 'diff-context "#bcbcac"))) ;; zenburn-fg-2

      ;; show-paren-mode
      (eval-after-load 'paren
	`(progn
	   (set-face-attribute 'show-paren-match    nil :weight 'bold :foreground nil :background ,zenburn-bg-1)
	   (set-face-attribute 'show-paren-mismatch nil :weight 'bold :foreground ,zenburn-red :background "#3c1313")))

      ;; folding
      (eval-after-load 'folding
	`(progn
	   (defface folding-header-line '((((class color) (min-colors 89))
					   (:foreground ,zenburn-green+4
							:background ,zenburn-bg-1
							:box (:line-width -1 :style released-button))))
	     "Face for folding headers")
	   (defvar folding-header-line-face 'folding-header-line)
	   (setq-default folding-font-lock-begin-mark 'folding-header-line-face
			 folding-font-lock-end-mark   'folding-header-line-face)))

      

      )))

;;; init-90-zenburn.el ends here
