;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; SPC f e R>  to install / update
     ;; language support
     clojure
     elixir
     emacs-lisp
     haskell
     javascript
     markdown
     react
     ruby
     ruby-on-rails
     shell-scripts
     sql
     yaml

     ;; fun
     colors

     ;; productivity
     git
     github
     helm
     org
     shell
     tmux
     vim-powerline
     )

   dotspacemacs-additional-packages '(powerline
                                      moe-theme
                                      dtrt-indent)
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists nil
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(moe-dark moe-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.1
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 80
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   otspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
    It is called immediately after `dotspacemacs/init', before layer configuration
    executes.
    This function is mostly useful for variables that need to be set
    before packages are loaded. If you are unsure, you should try in setting them in
    `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
    This function is called at the very end of Spacemacs initialization after
    layers configuration.
    This is the place where most of your configurations should be done. Unless it is
    explicitly specified that a variable should be set before a package is loaded,
    you should place your code here."

  ;; more vimlike behavior
  (setq evil-want-fine-undo t)

  ;; default behaviors
  (set-default 'truncate-lines t)
  (setq line-number-mode t)
  (setq column-number-mode t)
  (setq fill-column 80)
  (setq create-lockfiles nil)
  (setq x-select-enable-primary t)
  (setq x-select-enable-clipboard t)

  ;; alias yes no
  (defalias 'yes-or-no-p 'y-or-n-p)

  ;; skip straight to scratch buffer in text mode
  (setq inhibit-splash-screen t
        initial-scratch-message nil
        initial-major-mode 'text)

  ;; indentation behaviors
  (setq-default indent-tabs-mode nil
                tab-width 2)

  (setq ruby-indent-level 2
        js2-basic-offset 2
        js-indent-level 2)

  (add-hook 'coffee-mode-hook
            (lambda ()
              (tab-width 2)
              (evil-shift-width 2)))

  ;; exec-path / PATH setup
  (add-to-list 'exec-path' "/bin/")
  (add-to-list 'exec-path' "/usr/bin/")
  (add-to-list 'exec-path' "~/scripts/")

  ;; helm-projectile setup
  (setq projectile-enable-caching t)
  (projectile-global-mode)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "f782ed87369a7d568cee28d14922aa6d639f49dd676124d817dd82c8208985d0" "ba6f8606cae826654d4c2242363f2042dd35c1595ef6367ad44d5f42851e6aa9" "7f5837a7dbf54c2b7c41d94f5eb1373cf63274847d1971037faa24d7f2231eea" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "f04122bbc305a202967fa1838e20ff741455307c2ae80a26035fbf5d637e325f" "3632cf223c62cb7da121be0ed641a2243f7ec0130178722554e613c9ab3131de" "66132890ee1f884b4f8e901f0c61c5ed078809626a547dbefbb201f900d03fd8" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#073642" t)
 '(fringe-mode 6 nil (fringe))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(linum-format (quote dynamic) t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c37300")
     (60 . "#b97d00")
     (80 . "#b58900")
     (100 . "#a18700")
     (120 . "#9b8700")
     (140 . "#948700")
     (160 . "#8d8700")
     (180 . "#859900")
     (200 . "#5a942c")
     (220 . "#439b43")
     (240 . "#2da159")
     (260 . "#16a870")
     (280 . "#2aa198")
     (300 . "#009fa7")
     (320 . "#0097b7")
     (340 . "#008fc7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#nc 002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
