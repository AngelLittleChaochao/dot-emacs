(add-to-list 'load-path "~/etc/el/vendor")
(add-to-list 'load-path "~/etc/el/vendor/lua-mode")
(add-to-list 'load-path "~/etc/el/vendor/js2-mode-20170116")
(add-to-list 'load-path "~/etc/el/vendor/yasnippet")

(setq py-install-directory "~/etc/el/vendor/python-mode/")
(add-to-list 'load-path "~/etc/el/vendor/python-mode")

(add-to-list 'load-path "~/etc/el/")

;; load js configuration file
(load-file "~/etc/el/cc-js.el")


(require 'csharp-mode)
(require 'yaml-mode)
(require 'js2-mode)
(require 'lua-mode)
(require 'markdown-mode)

(require 'yasnippet)
(yas-global-mode 1)

(require 'ido)
(ido-mode t)

(require 'python-mode)

(defun my-csharp-mode-hook ()
  ;; enable the stuff you want for C# here
  (electric-pair-mode 1)       ;; Emacs 24
  (electric-pair-local-mode 1) ;; Emacs 25
  )

(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)

