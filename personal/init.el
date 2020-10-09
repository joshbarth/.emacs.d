(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(setq whitespace-line-column 120)

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

(use-package fsharp-mode
  :defer t
  :ensure t)

(require 'eglot-fsharp)

(use-package restclient
  :defer t
  :ensure t)

(add-hook 'fsharp-mode-hook 'rainbow-delimiters-mode)
