;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode Settings
(add-hook 'c-mode-common-hook '(lambda ()
				 (setq c-basic-indent 4)
				 (local-set-key (kbd "RET") 'newline-and-indent)))
