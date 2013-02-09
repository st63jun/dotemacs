;; init.el
(defun add-to-load-path (dir)
  (interactive "Ddirectory: ")
  (dolist (dir (let ((dir (expand-file-name dir)))
		 (list dir (format "%s%d" dir emacs-major-version))))
    (when (and (stringp dir) (file-directory-p dir))
      (let ((default-directory dir))
	(add-to-list 'load-path default-directory)
	(normal-top-level-add-subdirs-to-load-path)))))

(load "~/.emacs.d/init.el.d/general.el")
(load "~/.emacs.d/init.el.d/keybinding.el")
(load "~/.emacs.d/init.el.d/shell.el")
(load "~/.emacs.d/init.el.d/org.el")
(load "~/.emacs.d/init.el.d/latex.el")
(load "~/.emacs.d/init.el.d/java.el")

(if (file-exists-p "~/.emacs.d/init.el.d/local.el")
    (load "~/.emacs.d/init.el.d/local.el"))
