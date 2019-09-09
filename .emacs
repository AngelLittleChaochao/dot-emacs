(package-initialize)

(global-set-key "\M-k" 'other-window)
(global-set-key "\C-u" 'undo)
(global-set-key "\C-c\C-k" 'copy-line)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-c\C-u" 'uncomment-region)
(global-set-key "\C-c\C-r" 'revert-buffer)
(global-set-key "\M-s" 'eshell)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-cq" 'query-replace)
(global-set-key "\M-o" 'smart-open-line-above)


(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; override C-c C-r as revert buffer in python mode
(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key (kbd "\C-c\C-r") 'revert-buffer)
	    (local-set-key (kbd "\C-c\C-c") 'comment-region)
	    (local-set-key (kbd "\C-c\C-u") 'uncomment-region)
		(setq indent-tabs-mode nil)
	    (setq-default tab-width 4)
		(setq python-indent-offset 4)
		))




;; make emacs to install org
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; active org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key org-mode-map "\C-ci" 'org-clock-in)
(define-key org-mode-map "\C-co" 'org-clock-out)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-clock-into-drawer nil)

(setq org-agenda-files (list "~/org/work.org" "~/org/home.org"))
(setq org-latex-create-formula-image-program 'dvipng)

;; ADD emacs org load path
(add-to-list 'load-path "/usr/local/share/emacs/25.1/lisp")
(require 'ob-octave)


(load-file "~/etc/el/cc-custom.el")

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))
(add-to-list 'auto-mode-alist '("\\.lua" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

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

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


(show-paren-mode 1)
(menu-bar-mode -1)
(setq show-paren-delay 0)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(electric-pair-mode 1)
(delete-selection-mode 0)

;; code style
(set-face-foreground 'font-lock-comment-face "#949494")

;; set copy line key
 (defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
(put 'upcase-region 'disabled nil)

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
