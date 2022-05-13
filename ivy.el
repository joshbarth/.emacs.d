;;;; ivy completion

;;; ivy, swiper, and counsel
(use-package counsel
  :straight t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-backward)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("M-y" . counsel-yank-pop)
	 ("C-x b" . ivy-switch-buffer)
	 ("C-x d" . counsel-dired)
	 ("C-h f" . counsel-describe-function)
	 ("C-h v" . counsel-describe-variable)
	 ("C-h l" . counsel-find-library)
	 ("C-h i" . counsel-info-lookup-symbol)
	 ("C-c v" . ivy-push-view)
	 ("C-c V" . ivy-pop-view))
  :config
  (counsel-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))
