;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-insert-think-deep.el--备份相关设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun get-first-level-headings (file)
  "从 FILE 返回一级标题列表。"
  (with-temp-buffer
    (insert-file-contents file)
    (goto-char (point-min))
    (let (headings)
      (while (re-search-forward "^\\* \\(.+\\)" nil t)
        (push (match-string 1) headings))
      (nreverse headings))))

(defun insert-think-deep (&optional org-file)
  "从 ORG-FILE 插入随机一级标题到当前缓冲区。
如果未指定 ORG-FILE，则使用 Emacs 配置目录下的 'quotes.org'。"
  (interactive)
  (let ((file (or org-file (expand-file-name "quotes.org" user-emacs-directory))))
    (let ((headings (get-first-level-headings file)))
      (if headings
          (let ((random-heading (nth (random (length headings)) headings)))
            (insert random-heading))
        (message "在 %s 中未找到一级标题" file)))))

(provide 'pengshao-insert-think-deep)
