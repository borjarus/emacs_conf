;;; 15-package --- Emacs official package manager
;;; Commentary:
;;; Code:

(require 'package)

;; Repositories
(setq package-archives
      '(("gnu"         . "http://elpa.gnu.org/packages/")
        ("org"         . "http://orgmode.org/elpa/")
        ("melpa"       . "http://melpa.org/packages/")
        ("marmalade"   . "http://marmalade-repo.org/packages/")))

;; Don't auto-activate packages
(setq package-enable-at-startup nil)
(package-initialize nil)

;; Install use-packages, which will install everything else as needed
(unless (package-installed-p 'use-package)
  (message "Installing use-package…")
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Notify that Emacs is loading…
(use-package alert
  :ensure t
  :commands alert
  :config
  (setq alert-default-style 'libnotify))

(alert (concat "Emacs " emacs-version " is loading…")
       :severity 'low
       :icon "emacs"
       :title "Emacs")

;;; init-15-package.el ends here
