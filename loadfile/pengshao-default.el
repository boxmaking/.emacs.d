
;;关闭起动时的那个“开机画面” 
(setq inhibit-startup-message t)

;;(split-window-below)   ;; 横向分屏
;;(split-window-right)   ;; 纵向分屏


;;设置启动时候窗口大小
(setq default-frame-alist
'((height . 40) (width . 120) (menu-bar-lines . 20) (tool-bar-lines . 0)))


;在标题栏提示你目前在什么位置
(setq frame-title-format "pengshao@%n%b")
;;;设置标题栏显示文件的完整路径名
(setq frame-title-format
   '("%S" (buffer-file-name "%f"
    (dired-directory dired-directory "%b"))))

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
