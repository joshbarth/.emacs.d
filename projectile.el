(use-package projectile
  :straight t
  :config
  (projectile-mode +1)
  (when (featurep 'ivy)
    (setq projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map))
