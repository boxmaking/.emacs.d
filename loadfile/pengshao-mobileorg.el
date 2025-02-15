;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-mobileorg.el---mobileorg使用教程
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; 指定 Org 文件存储路径
(setq org-directory "~/public_note/idear/")

(setq org-mobile-files (quote ("~/public_note/idear/todo-list.org"
			       "~/public_note/idear/todo-list.org"
			       "~/public_note/idear/idear-list.org"
			       "~/public_note/idear/life.org"
			       "~/public_note/idear/2025-f1-calendar.org")))

(setq org-mobile-directory "~/iCloud_Org/mobile/")  ; MobileOrg 同步目录


;; 自动同步到 mobile 目录
(setq org-mobile-inbox-for-pull "~/iCloud_Org/mobile/inbox.org")
(setq org-mobile-force-mobile-id t)  ; 强制生成唯一 ID




(provide 'pengshao-mobileorg)

