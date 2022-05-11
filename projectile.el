(use-package projectile
  :straight t
  :config
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map))
