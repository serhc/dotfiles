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

;; general q
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
(use-package helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; in file autocompletion
(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode))

;; tab / indentation fixing
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(add-hook 'coffee-mode-hook (lambda ()
                              (setq coffee-tab-width 2)))

;; smooth scrolling
(use-package smooth-scrolling
  :config (smooth-scrolling-mode 1))

;; editing / view productivity
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'subword-mode)
(desktop-save-mode 1)
(show-paren-mode t)
(global-linum-mode t)
(column-number-mode 1)
(set-default 'truncate-lines t)

(use-package evil
  :config
  (evil-mode 1)
  (setq evil-want-fine-undo t)
  (define-key evil-normal-state-map (kbd "C-w C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w C-j") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w C-k") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w C-l") 'evil-window-right))

;; ysiw for yank-around-in-word
;; visual select S" for surround vs
(use-package evil-surround
  :config (global-evil-surround-mode 1))

(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
    "ff" 'helm-find-files
    "e!" 'revert-buffer
    "gb" 'magit-blame
    "gd" 'vc-diff
    "h"  'help
    ))
