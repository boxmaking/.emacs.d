;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-default.el---默认一小些配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; 时间戳使用英文星期
(setq system-time-locale "C")

; 东八区（北京时间）
(setq calendar-time-zone 8)  

;; 编码选用 UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


;;关闭起动时的那个“开机画面” 
(setq inhibit-startup-message t)

;;开始启动历史文件记录
(recentf-mode 1)
(global-set-key (kbd "C-c m h") 'recentf-open-files)

;;自动显示图片
(setq org-startup-with-inline-images t)


;;(split-window-below)   ;; 横向分屏
;;(split-window-right)   ;; 纵向分屏


;;设置启动时候窗口大小
(setq default-frame-alist
'((height . 30) (width . 100) (menu-bar-lines . 10) (tool-bar-lines . 10)))


;在标题栏提示你目前在什么位置
;(setq frame-title-format "pengshao@%n%b")



;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" "上古大椿,八千春秋,知途知径,浑然天成."
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name)) "%b"))))

;语法高亮
(global-font-lock-mode t)

;打开图片显示功能
(auto-image-file-mode t)


;显示列号
(column-number-mode t)
;显示行号
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'absolute) 



;显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;自动添加括号
(electric-pair-mode t)


;显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;去掉那个大大的工具栏
;;(tool-bar-mode nil)

;去掉滚动条
;;(scroll-bar-mode nil)

;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;默认显示 80列就换行
(setq default-fill-column 80)

;一打开就起用 text 模式。
;(setq default-major-mode 'text-mode)

;;eshell增加自动补全
; 忽略大小写进行补全
(setq eshell-cmpl-ignore-case t)
; 允许循环补全
(setq eshell-cmpl-cycle-completions t)
; 让 pcomplete 支持循环补全
(setq pcomplete-cycle-completions t) 



(provide 'pengshao-default)
