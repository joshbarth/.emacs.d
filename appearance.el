;;;; make emacs looks nice :) 

(add-to-list 'default-frame-alist '(font . "Hack 14"))
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(column-number-mode 1)
(line-number-mode 1)

(use-package gruvbox-theme
  :straight t
  :config
  (load-theme 'gruvbox-dark-hard t))

