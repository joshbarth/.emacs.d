;;;; everything we're always going to want

;;; sane window switching behavior
(use-package ace-window
  :straight t
  :bind ("C-x o" . ace-window))

;;; jump-to funcitonality
(use-package avy
  :straight t
  :bind
  ("C-:" . avy-goto-char)
  ("C-'" . avy-goto-char-2)
  ("M-g f" . avy-goto-line)
  ("M-g e" . avy-goto-word-1))

;;; miscellaneous useful stuff
(use-package crux
  :straight t)

;;; quick keybinds for copying words etc. when invoked without a selection
(use-package easy-kill
  :straight t
  :bind ("M-w" . easy-kill))

;;; commands for changing area selected
(use-package expand-region
  :straight t
  :bind ("C-=" . er/expand-region))

;;; rainbow parens!
(use-package rainbow-delimiters
  :straight t
  :hook (prog-mode . rainbow-delimiters-mode))

;;; tools for dealing with parens
(use-package smartparens
  :straight t)

;;; auto save when changing buffers
(use-package super-save
  :straight t
  :config
  (super-save-mode +1))

;;; suggest commands when prefixed keybind is entered
(use-package which-key
  :straight t
  :config
  (which-key-mode))

;;; tree-based undo management
(use-package undo-tree
  :straight t
  :config
  (global-undo-tree-mode))
