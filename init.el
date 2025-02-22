;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao's ~/.emacs.d/init.el
;;<2025-02-09/Sunday 19:23:31>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)


;;允许升级内建包
(setq package-install-upgrade-built-in t)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;自己的一些小的配置
(add-to-list 'load-path "~/.emacs.d/loadfile/")


;;mobileorg配置文件
;;(require 'pengshao-mobileorg)



;自动插入天气的配置
(require 'pengshao-openweather)

;;orgmode的全局设置
;;第一项是链接,第二项是待办事项,第三项是总结
(require 'pengshao-org-mode)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
;;这一项好像不用了已经彻底结束了
;;(global-set-key "\C-cb" 'org-iswitchb)

(require 'pengshao-org-publish)
;;在pengshao-org-publish.el文件当中设置了
;;(define-key global-map "\C-cp" 'org-publish)


(require 'pengshao-calendar)



(require 'pengshao-default)

(require 'pengshao-backup)

(require 'pengshao-insert-date)

(require 'pengshao-copy-cut-paste-killring)






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;加载下载的插件


(add-to-list 'load-path "~/.emacs.d/lisp/")


(require 'magit)
(global-set-key (kbd "C-c m g") 'magit-status) ; 绑定快捷键
(setq magit-git-executable "/usr/bin/git")    ; 指定Git路径

;;主题插件的配置文件
(require 'color-theme)
(color-theme-initialize)
(color-theme-snow)

(require 'iimage)

;;cuamode的cua-rectangle-mark-mode的快捷键
;;由于与orgmode有冲突,我把C-return改为
(global-set-key (kbd "C-c n") 'cua-rectangle-mark-mode)

;;日历显示农历
(require 'cal-china-x)
(setq calendar-mark-holidays-flag t)
;; (setq mark-holidays-in-calendar t) ; before emacs-25
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")))
(setq calendar-holidays
      (append cal-china-x-important-holidays
              cal-china-x-general-holidays
              ;;other-holidays
 	      ))

;;小小的tabbar-mode
(require 'tabbar)
(tabbar-mode)
;;切换buffer
;;prior就是上翻页pg up,next就是pg dn键盘
(global-set-key [C-prior] 'previous-buffer)
(global-set-key [C-next] 'next-buffer)
;;Win更换tabbar不错吧,前两个是在不同的分组切换,后面的是在同组切换
;;不知道为什么冲突了
;;(global-set-key [s-up] 'tabbar-backward-group)
;;(global-set-key [s-down] 'tabbar-backward-group)
;;(global-set-key [s-left] 'tabbar-backward-tab)
;;(global-set-key [s-right] 'tabbar-forward-tab)



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
;;窗口跳转跳过sr-speedbar
(setq sr-speedbar-skip-other-window-p t)
;;设置快捷键
;(global-set-key [f5] 'sr-speedbar-select-window)
(global-set-key [f5] 'sr-speedbar-open)
(global-set-key (kbd "C-c s") 'sr-speedbar-open)
(global-set-key (kbd "C-c x") 'sr-speedbar-close)
;;开机默认启动speedbar,不用了,现在用sr-speedbar了
;;(speedbar 1)
;;自动打开sr-speedbar
;;不知道为什么太不好用了,每次都多打开一个窗格,所以忽略了,
;;(sr-speedbar-open)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;键盘配置放在最后,只要是配置了F1-F10,和Home/End键
;;所有自己配置的都在init.el了,方便查找

(require 'pengshao-key-building)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/setup/theme-readtheorg\\.setup\\'"))
 '(package-selected-packages '(magit seq json-mode request)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; 在 Emacs 启动时清空 *scratch* 缓冲区并插入特定函数代码
(setq initial-scratch-message "") ; 清空初始的 *scratch* 消息
(with-current-buffer "*scratch*"
;   (let ((result1 (insert-weather)))
;   (insert (format " %s\n" result1)))
  (call-interactively 'insert-nongli)
  (call-interactively 'insert-weather)
  (call-interactively 'insert-pyphoon)
  
   )
