;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybind

;; Backspace
(global-set-key (kbd "C-h") 'backward-delete-char)

;; quick switch buffer
(global-set-key (kbd "C-x C-x") '(lambda () 
				   (interactive)
				   (switch-to-buffer (other-buffer))))
(global-set-key (kbd "C-x C-y") 'other-frame)
(global-set-key (kbd "C-o") 'other-window)

;; marking
(global-set-key (kbd "M-SPC") 'set-mark-command)
 
;; Windmove
(setq windmove-wrap-around t)
(global-set-key (kbd "C-x h") 'windmove-left)
(global-set-key (kbd "C-x j") 'windmove-down)
(global-set-key (kbd "C-x k") 'windmove-up)
(global-set-key (kbd "C-x l") 'windmove-right)

(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<right>") 'windmove-right)

(global-set-key (kbd "C-x H") 'mark-whole-buffer)
(global-set-key (kbd "C-x K") 'kill-buffer)

;; Window resize

(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the
middle"
  (let* ((win-edges (window-edges))
	  (this-window-y-min (nth 1 win-edges))
	   (this-window-y-max (nth 3 win-edges))
	    (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the
middle"
  (let* ((win-edges (window-edges))
	  (this-window-x-min (nth 0 win-edges))
	   (this-window-x-max (nth 2 win-edges))
	    (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((eq (+ fr-width 4) this-window-x-max) "right")
     (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

(global-set-key [C-M-up] 'win-resize-enlarge-horiz)
(global-set-key [C-M-down] 'win-resize-minimize-horiz)
(global-set-key [C-M-left] 'win-resize-enlarge-vert)
(global-set-key [C-M-right] 'win-resize-minimize-vert)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Platform specific settings
(cond ((eq system-type 'darwin)
       (setq ns-command-modifier (quote meta))))
