(package-initialize)

(global-set-key "\M-k" 'other-window)
(global-set-key "\C-u" 'undo)
(global-set-key "\C-c\C-k" 'copy-line)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-c\C-u" 'uncomment-region)
(global-set-key "\M-s" 'eshell)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-cq" 'query-replace)


(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; make emacs to install org
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; active org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key org-mode-map "\C-i" 'org-clock-in)
(define-key org-mode-map "\C-o" 'org-clock-out)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-clock-into-drawer nil)

(setq org-agenda-files (list "~/org/work.org" "~/org/home.org"))


(load-file "~/etc/el/cc-custom.el")


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))
(add-to-list 'auto-mode-alist '("\\.lua" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


(defun set-newline-and-indent ()
    (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'python-mode 'set-newline-and-indent)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (json-mode js2-mode org-plus-contrib))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(show-paren-mode 1)
(menu-bar-mode -1) 
(setq show-paren-delay 0)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(electric-pair-mode 1)


;; set copy line key
 (defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
