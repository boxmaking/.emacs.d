;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-default.el---默认一小些配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; 时间戳使用英文星期
(setq system-time-locale "C")


;; 编码选用 UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


;;关闭起动时的那个“开机画面” 
(setq inhibit-startup-message t)

;;(split-window-below)   ;; 横向分屏
;;(split-window-right)   ;; 纵向分屏


;;设置启动时候窗口大小
(setq default-frame-alist
'((height . 30) (width . 100) (menu-bar-lines . 10) (tool-bar-lines . 10)))


;在标题栏提示你目前在什么位置
;(setq frame-title-format "pengshao@%n%b")



;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" " 上马提枪, 去干他娘 - "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name)) "%b"))))

;语法高亮
(global-font-lock-mode t)

;打开图片显示功能
(auto-image-file-mode t)


;显示列号,显示行号码
(column-number-mode t)
(global-linum-mode t)

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








(provide 'pengshao-default)
