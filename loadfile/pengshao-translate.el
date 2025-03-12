;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-translate.el emacs调用sdcv来翻译单词和英文短语
;;<2025-03-12-071/Wednesday>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; 设置单词本和短语本的 org 文件路径

;; 定义文件路径
(defvar pengshao-english-file "~/life-note/pengshao-english.org"
  "File path for storing English vocabulary.")

;; 确保文件存在并初始化基本结构
(defun pengshao-english-init-file ()
  "Initialize the vocabulary org file if it doesn't exist."
  (unless (file-exists-p pengshao-english-file)
    (with-current-buffer (find-file-noselect pengshao-english-file)
      (insert "#+STARTUP: show2levels\n* word\n* line\n")
      (set-buffer-file-coding-system 'utf-8)  ; 明确指定 UTF-8 编码
      (save-buffer))))

;; 添加单个单词
(defun pengshao-english-add-word (word)
  "Add a single word to the vocabulary with its translation."
  (interactive "sEnter word to translate: ")
  (pengshao-english-init-file)
  (let* ((translation (shell-command-to-string 
                       (format "sdcv -n --utf8-output %s " 
                               (shell-quote-argument word))))
         (current-date (format-time-string "%Y-%m-%d")))
    (with-current-buffer (find-file-noselect pengshao-english-file)
      (set-buffer-file-coding-system 'utf-8)  ; 确保缓冲区使用 UTF-8
      (goto-char (point-min))
      (search-forward "* word")
      (org-end-of-subtree)
      (insert (format "\n** %s\n:PROPERTIES:\n:ADDED: %s\n:END:\n%s\n"
                      word current-date translation))
      (org-back-to-heading)
      (org-set-tags ":VOCAB:")
      (org-schedule nil "+1d")
      (org-deadline nil "+7d")
      (org-content 2)  ; 只显示一级和二级标题
      (save-buffer))))

;; 添加短语并分解单词
(defun pengshao-english-add-phrase (phrase)
  "Add a phrase and break it down into individual words with translations."
  (interactive "sEnter phrase to translate: ")
  (pengshao-english-init-file)
  (let* ((words (split-string phrase "[^[:alnum:]]+" t))
         (current-date (format-time-string "%Y-%m-%d")))
    (with-current-buffer (find-file-noselect pengshao-english-file)
      (set-buffer-file-coding-system 'utf-8)  ; 确保缓冲区使用 UTF-8
      (goto-char (point-min))
      (search-forward "* line")
      (org-end-of-subtree)
      (insert (format "\n** %s\n:PROPERTIES:\n:ADDED: %s\n:END:\n"
                      phrase current-date))
      (dolist (word words)
        (let ((translation (shell-command-to-string 
                           (format "sdcv -n --utf8-output  %s "
                                   (shell-quote-argument word))))
              (clean-word (downcase word)))
          (insert (format "*** %s\n%s\n" clean-word translation))))
      (org-back-to-heading)
      (org-set-tags ":PHRASE:")
      (org-schedule nil "+1d")
      (org-deadline nil "+7d")
      (org-content 2)  ; 只显示一级和二级标题
      (save-buffer))))



;; 定义全局快捷键
(global-set-key (kbd "C-c m e") 'pengshao-english-add-word)
(global-set-key (kbd "C-c m l") 'pengshao-english-add-phrase)


(provide 'pengshao-translate)

;;; pengshao-english.el ends here

