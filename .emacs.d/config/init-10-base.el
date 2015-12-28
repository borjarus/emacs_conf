;;; 15-base --- Emacs official package manager
;;; Commentary:
;;; Code:



;; remove toolbar and scroll
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Change "yes or no" to "y or n" 
(fset 'yes-or-no-p 'y-or-n-p)


;; Enable Ido Everywhere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; Unable to hide welcome screen in Emacs
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)


;;; init-10-base.el ends here
