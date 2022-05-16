(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(defun file-parent-directory-name (file)
  "Returns the name of the files parent directory, (not the absolute path)"
  (file-name-base (directory-file-name (file-name-directory file))))

(defun org-roam-node-find-excluding-dailies ()
  "Find and open an org-roam node, but exclude daily files from the search."
  (interactive)
  (org-roam-node-find
   nil "" (lambda (node) (not (equal (file-parent-directory-name
				      (org-roam-node-file node))
				     "daily")))))

(use-package org-roam
  :straight t
  :custom
  (org-roam-directory (file-truename "~/org/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find-excluding-dailies)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-setup))

(use-package org-roam-ui
  :straight t
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(setq org-roam-capture-templates
      '(("g" "general" plain "%?"
         :target (file+head "general/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n") :unnarrowed t)
        ("m" "maersk" plain "%?"
         :target (file+head "maersk/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n") :unnarrowed t)
        ("p" "personal" plain "%?"
         :target (file+head "personal/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n") :unnarrowed t)))

(setq org-roam-dailies-directory "")

(setq org-roam-dailies-capture-templates
      '(("g" "general" entry "* %?" :target
	 (file+head "general/daily/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>"))
	("m" "maersk" entry "* %?" :target
	 (file+head "maersk/daily/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>"))
	("p" "personal" entry "* %?" :target
	 (file+head "personal/daily/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>"))))
