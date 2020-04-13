;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao's ~/.emacs.d/init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;自己的一些小的配置
(add-to-list 'load-path "~/.emacs.d/loadfile/")

(require 'pengshao-org-mode)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(require 'pengshao-org-publish)


(require 'pengshao-calendar)

(require 'pengshao-default)

(require 'pengshao-backup)

(require 'pengshao-insert-date)

(require 'pengshao-copy-cut-paste-killring)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;加载别的插件


(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'color-theme)
(color-theme-initialize)
(color-theme-snow)

(require 'iimage)

(require 'tabbar)
(tabbar-mode)

(require 'htmlize)

(require 'word-like-count-mode)
(global-set-key "\C-xw" 'word-like-count-mode)

(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)


(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict/")
(ac-config-default)
(define-key ac-mode-map (kbd "C-c q") 'auto-complete)




(require 'sr-speedbar)
;;左侧显示
(setq sr-speedbar-right-side nil)
;;宽度
(setq sr-speedbar-width 25)
;;显示.的头文件
(setq speedbar-directory-unshown-regexp "^\(\.\.*$\)\'")
;;设置快捷键,在快捷键配置文件内设置了
;;(global-set-key [f5] 'sr-speedbar-select-window)
;;(global-set-key (kbd "C-c s") 'sr-speedbar-open)
;;(global-set-key (kbd "C-c x") 'sr-speedbar-close)
;;窗口跳转跳过sr-speedbar
(setq sr-speedbar-skip-other-window-p t)
;;自动打开sr-speedbar
;;不知道为什么太不好用了,总是多大开一个窗格
;;(sr-speedbar-open)

;;开机默认启动speedbar,现在用sr-speedbar了
;;(speedbar 1)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;键盘配置放在最后

(require 'pengshao-key-building)
