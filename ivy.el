;;;; ivy completion

;;; ivy, swiper, and counsel
(use-package counsel
  :straight t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-backward))
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))
