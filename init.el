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
;;在pengshao-org-publish.el文件当中设置了
;;(define-key global-map "\C-cp" 'org-publish)


(require 'pengshao-calendar)

(require 'pengshao-default)

(require 'pengshao-backup)

(require 'pengshao-insert-date)

(require 'pengshao-copy-cut-paste-killring)

;;cua-rectangle-mark-mode的快捷键
(global-set-key (kbd "C-c n") 'cua-rectangle-mark-mode)

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
;;切换buffer
;;prior就是上翻页pg up,next就是pg dn键盘
;(global-set-key [C-prior] 'previous-buffer)
;(global-set-key [C-next] 'next-buffer)

;;Win更换tabbar不错吧,前两个是在不同的分组切换,后面的是在同组切换
(global-set-key [s-up] 'tabbar-backward-group)
(global-set-key [s-down] 'tabbar-backward-group)
(global-set-key [s-left] 'tabbar-backward-tab)
(global-set-key [s-right] 'tabbar-forward-tab)


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



(require 'youdao-dictionary)
;; Enable Cache
(setq url-automatic-caching t)
;; Example Key binding
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
;; (push "*Youdao Dictionary*" popwin:special-display-config)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
;; Enable Chinese word segmentation support (支持中文分词)
;; (setq youdao-dictionary-use-chinese-word-segmentation t)


(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)     ;;左侧显示
(setq sr-speedbar-width 25)          ;;宽度
(setq speedbar-directory-unshown-regexp "^\(\.\.*$\)\'")       ;;显示.的头文件
(setq sr-speedbar-skip-other-window-p t)            ;;窗口跳转跳过sr-speedbar
;;设置快捷键
(global-set-key [f5] 'sr-speedbar-select-window)
(global-set-key (kbd "C-c s") 'sr-speedbar-open)
(global-set-key (kbd "C-c x") 'sr-speedbar-close)

;;自动打开sr-speedbar
;;不知道为什么太不好用了,每次都多打开一个窗格,所以忽略了,
;;(sr-speedbar-open)

;;开机默认启动speedbar,不用了,现在用sr-speedbar了
;;(speedbar 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;键盘配置放在最后,只要是配置了F1-F10,和Home/End键,所有自己配置的都在init.el了,方便查找

(require 'pengshao-key-building)
