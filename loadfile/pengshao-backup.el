;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-backup.el--备份相关设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq
 backup-by-copying t    ;自动备份
 delete-old-versions t ; 自动删除旧的备份文件
 kept-new-versions 10   ; 保留最近的50个备份文件
 kept-old-versions 2   ; 保留最早的2个备份文件
 version-control t    ; 多次备份
 ;; 把生成的备份文件放到统一的一个目录,而不在在文件当前目录生成好多 ~ #的文件
 ;; 如果你编辑某个文件时 后悔了想恢复成以前的一个版本 你可以到这个目录下找到备份的版本


 backup-directory-alist `((".*" . "~/emacs.backup/cache/backup_files/")) ;
 auto-save-file-name-transforms `((".*" "~/emacs.backup/cache/backup_files/" t))
 auto-save-list-file-prefix   "~/emacs.backup/cache/backup_files/saves-")



(provide 'pengshao-backup)
