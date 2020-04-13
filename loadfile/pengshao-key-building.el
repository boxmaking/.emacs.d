;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;; pengshao-key-building.el --- 全局键盘绑定设置
;; 最好放在加载文件的最后,防止被覆盖
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;习惯设置，Home键设定光标到文件开头
(global-set-key [(home)] 'beginning-of-buffer)
;;习惯设置，End键设定光标到文件结尾
(global-set-key [(end)] 'end-of-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;切换buffer
;;prior就是上翻页pg up,next就是pg dn键盘
;(global-set-key [C-prior] 'previous-buffer)
;(global-set-key [C-next] 'next-buffer)

;;Win更换tabbar不错吧,前两个是在不同的分组切换,后面的是在同组切换
(global-set-key [s-up] 'tabbar-backward-group)
(global-set-key [s-down] 'tabbar-backward-group)
(global-set-key [s-left] 'tabbar-backward-tab)
(global-set-key [s-right] 'tabbar-forward-tab)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;F1到F10

;;F1,打开帮助，常用帮助有info和woman（就是在emacs中看man）
(global-set-key [f1] 'info)

;;F2,恢复，
(global-set-key [f2] 'undo)

;;F3,反恢复，
;(global-set-key [f3] 'redo)

;;F3,快速打开配置文件
(global-set-key [f3] 'open-init-file)


;;F4,kill当前buffer
(global-set-key [f4] 'kill-this-buffer)

;;F5,speedbar
(global-set-key [f5] 'sr-speedbar-select-window)
(global-set-key (kbd "C-c s") 'sr-speedbar-open)
(global-set-key (kbd "C-c x") 'sr-speedbar-close)

;;F6,fired
(global-set-key [f6] 'dired)

;;F7,eshell,shell,terminal-emulator
(global-set-key [f7] 'shell)

;;;F8,list-bookmarks
(global-set-key [f8] 'list-bookmarks)

;;;F9,bookmark-set
(global-set-key [f9] 'bookmark-set)

;;看新闻组，常用的很，不过更多时间现在sir里
;;(global-set-key [f9] 'gnus)

;;F10，打开／关闭菜单
(global-set-key [f10] 'menu-bar-mode)

;;编译等，暂时还不常用的设置
;;(global-set-key [f11] 'compile)
;;(global-set-key [f12] 'todo-show)
;;(global-set-key [f12] 'gdb)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






(provide 'pengshao-key-building)

