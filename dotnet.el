(use-package csharp-mode
  :straight t)

(use-package csproj-mode
  :straight t)

(use-package dotnet
  :straight t
  :hook
  (csharp-mode . dotnet-mode))

(use-package fsharp-mode
  :straight t)

(use-package flycheck
  :straight t
  :hook (csharp-mode . flycheck-mode))

(use-package lsp-mode
  :straight t
  :hook
  (csharp-mode . lsp))
