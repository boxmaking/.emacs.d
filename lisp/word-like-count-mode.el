;;; word-like-count.el --- show word like count in status bar


;;; Commentary:
;;
;; A simple minor-mode to display the word like coun in the status bar.


;;; Code:


(provide 'word-like-count-mode)



(defun spciall-words-count (start end regexp)
(let ((count 0))
(save-excursion
(goto-char start)

(while (and (< (point) end)
(re-search-forward regexp end t))
(setq count (1+ count))))
count))


;; add length display to mode-line construct
(setq mode-line-position (assq-delete-all 'word-like-count-mode mode-line-position))


(setq mode-line-position
(append
mode-line-position
'((word-like-count-mode
(6 (:eval (format " %d,%d,%d,%d,%d"
(+ (spciall-words-count (point-min) (point-max) "\\cc") (spciall-words-count (point-min) (point-max) "[A-Za-z0-9][A-Za-z0-9[:punct:]]*"))
(spciall-words-count (point-min) (point-max) "[^[:space:]]")
(- (point-max) 1)
(spciall-words-count (point-min) (point-max) "[A-Za-z0-9][A-Za-z0-9[:punct:]]*")
(spciall-words-count (point-min) (point-max) "\\cc"))))
nil))))




(define-minor-mode word-like-count-mode
"A simple minor-mode to display the word like coun in the status bar.")




;;; word-like-count-mode.el ends here


;找不到这种插件，我用wc-mode按照word规则改了一个，你用用看吧。
;新建一个word-like-count-mode.el文件
;然后在你的配置文件中加入
;(add-to-list 'load-path "word-like-count-mode.el所在的文件夹")
;(require 'word-like-count-mode)


;;(global-set-key "\C-xw" 'word-like-count-mode)
