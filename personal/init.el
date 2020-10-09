(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(setq inhibit-startup-screen t
      initial-scratch-message "")

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package base16-theme
             :ensure t
             :config
             (load-theme 'base16-atelier-forest t))

(setq font "hack 12")
(set-face-attribute 'default t :font font)
(set-frame-font font nil t)

(require 'eglot-fsharp)
(use-package fsharp-mode
  :defer t
  :ensure t)

(global-set-key (kbd "C-x t f") 'random-timer-log-false)
(global-set-key (kbd "C-x t t") 'random-timer-log-true)
(global-set-key (kbd "C-x t s") 'random-timer-start)
(global-set-key (kbd "C-x t p") 'random-timer-stop)
