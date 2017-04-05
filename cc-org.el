;; make emacs to install org
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; active org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key org-mode-map "\C-i" 'org-clock-in)
(define-key org-mode-map "\C-o" 'org-clock-out)


(setq org-clock-into-drawer nil)

(setq org-agenda-files (list "~/org/work.org" "~/org/home.org"))
