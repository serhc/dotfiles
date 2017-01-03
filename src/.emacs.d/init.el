;; set up core package host
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; load use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; set clipboard copy/paste action (only works in gui)
(setq yank-pop-change-selection t
      x-select-enable-clipboard t
      select-enable-clipboard t
      x-select-enable-primary t)

;; set gui /display options
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(menu-bar-mode -1)

;; prevent file system litter
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; general qol
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "RET") 'newline-and-indent)

;; productivity plugins
(use-package powerline)

;; theme / color packages
(use-package moe-theme
  :config
    (moe-dark)
    (powerline-moe-theme))

;; magit / git stuff
(use-package magit)
(use-package evil-magit)

;; helm / autocompletion
(require 'helm)
(require 'helm-config)
(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "M-x") 'helm-M-x)

;; in file autocompletion
(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode))

;; indentation fixing
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq coffee-tab-width 2)
(add-hook 'coffee-mode-hook (lambda ()
                              (setq coffee-tab-width 2)))

;; editing / view productivity
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'subword-mode)
(desktop-save-mode 1)
(show-paren-mode t)
(global-linum-mode t)
(column-number-mode 1)
(set-default 'truncate-lines t)


(use-package evil
  :init
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "C-w C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w C-j") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w C-k") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w C-l") 'evil-window-right))
