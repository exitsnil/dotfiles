;; bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; package list
;; (straight-use-package 'evil)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'lsp-java)
(straight-use-package 'lsp-metals)
(straight-use-package 'ivy)
(straight-use-package 'dash)
(straight-use-package 'cider)
(straight-use-package 'company)
(straight-use-package 'flycheck)
(straight-use-package 'go-mode)
(straight-use-package 'lua-mode)
(straight-use-package 'clojure-mode)
(straight-use-package 'geiser)
(straight-use-package 'geiser-guile)
(straight-use-package 'doom-modeline)
(straight-use-package 'dap-mode)
(straight-use-package 'magit)
(straight-use-package 'paredit)
(straight-use-package 'typescript-mode)
(straight-use-package 'scala-mode)
(straight-use-package 'sbt-mode)

;; core configuration
(setq auto-save-default nil)

;; GUI stuff
(menu-bar-mode 1)
(tool-bar-mode -1)
(setq make-backup-files nil)
(set-frame-font "JetBrains Mono 13" nil t)
(set-face-attribute 'default nil :family "JetBrains Mono")
(set-face-attribute 'variable-pitch nil :family "JetBrains Mono")
;; (global-font-lock-mode 0)
(setq-default truncate-lines t)
(setq resize-mini-windows nil)
(setq eldoc-echo-area-use-multiline-p t)
;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
(load-theme 'modus-operandi :no-confirm)
(pixel-scroll-precision-mode 1)
(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

;; evil-mode
;; (evil-mode)

;; org-mode
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; lsp-mode
(require 'lsp-mode)
(setq gc-cons-threshold (* 100 1024 1024)) ;; 100MB
(setq read-process-output-max (* 1024 1024)) ;; 1MB

;; lsp-ui
(require 'lsp-ui)
(setq lsp-ui-doc-use-childframe t)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-show-with-mouse nil)
;; todo: need to make hovertext window thingy not look bad

;; lsp-mode packages
(require 'lsp-java)
(require 'lsp-metals)

;; doom-modeline
(require 'doom-modeline)
(setq doom-modeline-icon nil)
(doom-modeline-mode 1)

;; company-mode
(global-company-mode)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; geiser
(add-hook 'scheme-mode-hook 'geiser-mode)

;; paredit
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'guile-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)

;; go-mode
(setq gofmt-command "goimports")
(defun go-fmt-on-save ()
  "Run gofmt before saving file in go-mode."
  (when (eq major-mode 'go-mode)
    #'gofmt-before-save)
  )
(add-hook 'before-save-hook #'go-fmt-on-save)

;; ensure eglot connects to LSP servers
;; go
(add-hook 'go-mode-hook #'lsp) ; gopls
;; clojure
(add-hook 'clojure-mode-hook #'lsp) ; clojure-lsp
;; c
(add-hook 'c-mode-hook #'lsp) ; clangd
;; cpp
(add-hook 'c++-mode-hook #'lsp) ; clangd
;; javascript
(add-hook 'js-mode-hook #'lsp) ; typescript-language-server
;; typescript
(add-hook 'typescript-mode-hook #'lsp) ; typescript-language-server
(add-hook 'ts-mode-hook #'lsp)
;; scala
(add-hook 'scala-mode-hook #'lsp)
;; java
(add-hook 'java-mode-hook #'lsp)

;; notmuch
;; (require 'notmuch)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
