;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flymake

(require 'flymake)
(setq flymake-allowed-file-name-masks
      (quote (("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init)
	      ("\\.xml\\'" flymake-xml-init)
	      ("\\.html?\\'" flymake-xml-init) 
	      ("\\.cs\\'" flymake-simple-make-init)
	      ("\\.p[ml]\\'" flymake-perl-init)
	      ("\\.php[345]?\\'" flymake-php-init)
	      ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup)
	      ("\\.java\\'" flymake-simple-ant-java-init flymake-master-cleanup)
	      ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
	      ("\\.tex\\'" flymake-simple-tex-init)
	      ("\\.idl\\'" flymake-simple-make-init))))

(global-set-key [f3] 'flymake-display-err-menu-for-current-line)
(global-set-key [f4] 'flymake-goto-next-error)
