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

;; set gui /display options
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(menu-bar-mode -1)

;; prevent file system litter
(setq make-backup-files nil)
(setq-default create-lockfiles nil)

;; general qol
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "RET") 'newline-and-indent)

;; productivity plugins
(use-package powerline
  :config (powerline-default-theme))

;; theme / color packages
(use-package moe-theme
  :config (moe-dark))

;; magit / git stuff
(use-package magit)
(use-package evil-magit)

;; helm / autocompletion
(use-package helm)
(use-package helm-projectile
  :config
  (helm-projectile-on)
  (projectile-global-mode))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; in file autocompletion
(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode))

;; tab / indentation fixing
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(use-package coffee-mode
  :init (add-hook 'coffee-mode-hook (lambda ()
                              (setq coffee-tab-width 2))))
(use-package yaml-mode)
(use-package haskell-mode)
(use-package haml-mode)
(use-package sass-mode)

;; smooth scrolling
(use-package smooth-scrolling
  :config (smooth-scrolling-mode 1))

;; set clipboard copy/paste action (only works in gui)
(setq yank-pop-change-selection t
      x-select-enable-clipboard t
      select-enable-clipboard t
      x-select-enable-primary t)

;; editing / view productivity
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'subword-mode)
(desktop-save-mode 1)
(show-paren-mode t)
(global-linum-mode t)
(column-number-mode 1)
(set-default 'truncate-lines t)


;; ysiw for yank-around-in-word
;; visual select S" for surround vs
(use-package evil-surround
  :config (global-evil-surround-mode 1))

(use-package evil-leader
  :init
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
    "e!" 'revert-buffer
    "fb" 'helm-mini
    "ff" 'helm-find-files
    "fs" 'helm-semantic-or-imenu
    "gb" 'magit-blame
    "gd" 'vc-diff
    "h"  'help
    "pf" 'helm-projectile-find-file
    "w+" (lambda () (interactive) (evil-window-increase-width 15))
    "w-" (lambda () (interactive) (evil-window-decrease-width 15))
    "x"  'comment-region
    ))

;; finally set all evil settings
(use-package evil
  :config
  (evil-mode 1)
  (setq evil-want-fine-undo t)
  (define-key evil-normal-state-map (kbd "C-w C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w C-j") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w C-k") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w C-l") 'evil-window-right))

(message "load success")
