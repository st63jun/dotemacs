;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scheme (Gauche)
(setq scheme-program-name "gosh -i")

(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(add-hook 'scheme-mode-hook
  (lambda ()
    (local-set-key (kbd "C-c s") 'scheme-other-window)))
