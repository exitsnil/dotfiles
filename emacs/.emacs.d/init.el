;; -*- lexical-binding: t; -*-

;; bootstrap packages
(require 'package)
(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
    ("nongnu" . "https://elpa.nongnu.org/nongnu/")
    ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; refresh package contents if necessary
(unless package-archive-contents
  (package-refresh-contents))

;; define list of packages used by Emacs
(defvar my-packages
  '(ivy
    dash
    cider
    company
    flycheck
    go-mode
    lua-mode
    clojure-mode
    geiser
    geiser-guile
    doom-modeline
    dap-mode
    magit
    paredit
    typescript-mode
    scala-mode
    sbt-mode
    exec-path-from-shell))

;; install any missing packages
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; core configuration
(setq auto-save-default nil)

;; GUI stuff
(menu-bar-mode -1)
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
(load-theme 'modus-vivendi :no-confirm)
(pixel-scroll-precision-mode 1)
(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

;; evil-mode
;; (evil-mode)

;; org-mode
(add-hook 'org-mode-hook 'turn-on-auto-fill)

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
(add-hook 'go-mode-hook 'eglot-ensure) ; gopls
;; clojure
(add-hook 'clojure-mode-hook 'eglot-ensure) ; clojure-lsp
;; c
(add-hook 'c-mode-hook 'eglot-ensure) ; clangd
;; cpp
(add-hook 'c++-mode-hook 'eglot-ensure) ; clangd
;; javascript
(add-hook 'js-mode-hook 'eglot-ensure) ; typescript-language-server
;; typescript
(add-hook 'typescript-mode-hook 'eglot-ensure) ; typescript-language-server
(add-hook 'ts-mode-hook 'eglot-ensure)
;; scala
(add-hook 'scala-mode-hook 'eglot-ensure)
;; java
(add-hook 'java-mode-hook 'eglot-ensure)
;; perl
(add-hook 'perl-mode-hook 'eglot-ensure)
(add-hook 'cperl-mode-hook 'eglot-ensure)

;; notmuch
;; (require 'notmuch)

;; setup $PATH and $MANPATH
(when (memq window-system '(mac ns x pgtk))
  (exec-path-from-shell-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(cider company dap-mode dash doom-modeline exec-path-from-shell
	   flycheck geiser geiser-guile go-mode ivy magit paredit
	   sbt-mode scala-mode typescript-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
