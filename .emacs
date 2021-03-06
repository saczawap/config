(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-o") 'forward-word)
(global-set-key (kbd "M-i") 'backward-word)
(global-set-key (kbd "M-u") 'beginning-of-line)
(global-set-key (kbd "M-p") 'end-of-line)
(defun newline-without-break-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))

(global-set-key (kbd "<C-S-return>") 'newline-without-break-of-line)
(defun up-newline-without-break-of-line ()

  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (previous-line))

(global-set-key (kbd "<C-return>") 'up-newline-without-break-of-line)
(tool-bar-mode -1)
;(cua-mode t)
