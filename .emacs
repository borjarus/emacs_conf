(defun mila/init-emacs ()
  "Load various emacs init files"
  (interactive)
  (dolist (file (directory-files "~/.emacs.d/config/" nil "^init-[0-9]+-.+\.el$"))
    (load (concat "~/.emacs.d/config/" file))))
(mila/init-emacs)





;; smex configuration
;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; SLIME
; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;(setq inferior-lisp-program "C:/sbcl/sbcl.exe")
;(setq slime-contribs '(slime-scratch slime-editing-commands slime-repl))
  ;; Replace "sbcl" with the path to your implementation

;; MULTI SCRATCH
;(require 'multi-scratch)

;; VIRTUAL DESKTOPS
;(require 'virtual-desktops)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f024aea709fb96583cf4ced924139ac60ddca48d25c23a9d1cd657a2cf1e4728" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
