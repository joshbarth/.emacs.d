;;; vc changes highlighting in the gutter
(use-package diff-hl
  :straight t
  :config
  (global-diff-hl-mode)
  :hook ((magit-pre-refresh . diff-hl-magit-pre-refresh)
	 (magit-post-refresh . diff-hl-magit-post-refresh)))

;;; git commit history
(use-package git-timemachine
  :straight t)

;;; fancy git ui
(use-package magit
  :straight t)
