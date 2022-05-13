(use-package company
  :straight t  
  :hook
  (prog-mode . company-mode)
  (org-mode . company-mode)
  :config
  (setq company-backends '((company-capf company-dabbrev-code))))
