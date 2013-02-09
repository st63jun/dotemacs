;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; active Babel languages
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
	 (dot . t)
	 (ditaa . t)
	 (R . t)
	 (python . t)
	 (ruby . t)
	 (gnuplot . t)
	 (clojure . t)
	 (sh . t)
	 (ledger . t)
	 (org . t)
	 (plantuml . t)
	 (latex . t)
	 (scheme . t)
	 (java . t))))

(setq org-babel-scheme-cmd "gosh")

;; ditaa path
(setq org-ditaa-jar-path "~/.emacs.d/init.el.d/tools/ditaa0_9/ditaa0_9.jar")

;; LaTeX export
(require 'org-latex)
(setq org-latex-to-pdf-process 
      '("~/.emacs.d/init.el.d/tools/pdfplatex %f"
        "~/.emacs.d/init.el.d/tools/pdfplatex %f"))
(add-to-list 'org-export-latex-classes
             '("progress-report"
               "
\\documentclass{progress_report}
\\setlength{\\voffset}{-0.2in}
\\setlength{\\topmargin}{0pt}
\\setlength{\\headheight}{0pt}
\\setlength{\\headsep}{0pt}
\\usepackage[dvipdfmx]{graphicx}
		"
	       ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-export-latex-classes
  '("jsarticle"
    "\\documentclass{jsarticle}
[NO-DEFAULT-PACKAGES]
[EXTRA]"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
))

