;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compilation settings for Ant

(defun find-build-xml-from (dir)
  "Search `build.xml' file from current and parent directories."
  (if (equal dir "")
      (error "`build.xml' is not found.")
    (if (member "build.xml"
		(directory-files (directory-file-name dir)))
	(concat dir "/build.xml")
      (find-build-xml-from
       (mapconcat #'identity
		  (butlast (split-string dir "/" nil))
		  "/")))))

(defun compile-ant ()
  "Compile with Apache Ant."
  (interactive)
  (compile (compilation-read-command
	    (concat "ant -emacs -f "
		    (find-build-xml-from
		     (mapconcat #'identity
				(butlast (split-string (buffer-file-name) "/" nil))
				"/"))
		    " "))))


(add-hook 'java-mode-hook
	  '(lambda ()
	     (setq tab-width 4)            ; タブ幅4
	     (setq indent-tabs-mode nil)   ; タブ文字でなくてスペースを使う
	     (local-set-key (kbd "C-c a") 'compile-ant)
	     (local-set-key (kbd "RET") 'newline-and-indent)
	     (electric-pair-mode t)
	     (auto-complete-mode t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flymake settings
(require 'flymake)

; for fix build.xml pathname error
(defun flymake-get-ant-cmdline (source base-dir)
  (list "ant"
	(list "-buildfile"
	      (concat base-dir "build.xml")
	      (concat "-DCHK_SOURCES=" source)
	      "check-syntax")))

; for fix base-dir pathname error
(defun flymake-init-find-buildfile-dir (source-file-name buildfile-name)
  "Find buildfile, store its dir in buffer data and return its dir, if found."
  (let* ((buildfile-dir
          (flymake-find-buildfile buildfile-name
                                  (file-name-directory source-file-name))))
    (if buildfile-dir
        (setq flymake-base-dir (expand-file-name buildfile-dir))
      (flymake-log 1 "no buildfile (%s) for %s" buildfile-name source-file-name)
      (flymake-report-fatal-status
       "NOMK" (format "No buildfile (%s) found for %s"
                      buildfile-name source-file-name)))))

(add-hook 'java-mode-hook
	  '(lambda ()
	     ;(flymake-mode t)
	     (local-set-key (kbd "M-e") 'flymake-goto-next-error)
	     (local-set-key (kbd "M-a") 'flymake-goto-prev-error)))

(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
  (flymake-display-err-menu-for-current-line))
(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
  (flymake-display-err-menu-for-current-line))

(ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
(ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quick access to Java API docs
(defun describe-java-api (symbol-name)
  (interactive "MJava Class:")
  (let ((url (concat
	      "http://docs.oracle.com/javase/7/docs/api/"
	      (replace-regexp-in-string "\\." "/" symbol-name)
	      ".html")))
    (browse-url url)))
