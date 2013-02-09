;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTeX
(setq tex-command "ptex")
(setq tex-run-command "ptex -kanji=utf8")
(setq latex-run-command "platex -kanji=utf8")
(setq tex-bibtex-command "pbibtex -kanji=utf8")
(setq tex-dvi-print-command "dvipdfmx")

(defun set-latex-kanji-code (coding)
  (interactive "sKanji encoding: ")
  (setq tex-run-command (concat "ptex -kanji=" coding))
  (setq latex-run-command (concat "platex -kanji=" coding))
  (setq tex-bibtex-command (concat "pbibtex -kanji=" coding))
  (message "now platex using %s." coding))
