;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-org-publish.el---org-publish相关的配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ox-publish)
(setq org-publish-project-alist
      '(
         ("psnote-org"
             :base-directory "~/psnote_public/"
             :base-extension "org"
             :publishing-directory "~/note_site/"
             :recursive t     ;是否递归
             :publishing-function org-html-publish-to-html  ;使用哪个函数来进行publish（注：org 7与8在这个地方有区别）
             :headline-levels 2   ;由于大纲结构也用于列表和任务,因此只有前4个级别用作标题更深的级别会被看作项目列表,我设置的2
             :auto-preamble t     ;自动前言
             :section-numbers t ;章节数字是否显示
             :author "pengshao"   ;作者
             :email "pengshao58@gmail.com"   ;邮箱
             :auto-sitemap t                  ; 自动生成 sitemap.org 文件
	     :exclude "idear.org\\|sitemap.org\\|setup.org"   ;; regexp
	     :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
             :sitemap-title "PengShao's BLOG!"         ; ... with title
             ;:sitemap-sort-files anti-chronologically   ;我这里采用的是按照从新到旧的排列方式
             sitemap-file-entry-format "%d %t"   ;这里采用时间+标题的方式生成sitemap 
	     :style-include-default nil  ;禁用默认 css 样式,使用自定义css
	     ;:html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/home/pengshao/psnote_public/site/css/org.css\"/>"
	     ;" " 里的内容是作为一个字符串给予 html-head 变量并插入到生成的 html 文件的 head 部,因此里面的某些字符必须避免转义，比如双引号必须加上反斜杠,href 的赋值不会做如何转换，因此必须确保是在生成的 html 文件能够访问的绝对路径。
	     ;:html-home/up-format "<div id=\"org-div-home-and-up\"> <a accesskey=\"h\" href=\"/home/pengshao/psnote_public/site/index.html\"> UP </a> | <a accesskey=\"H\" href=\"/home/pengshao/psnote_public/site/index.html\"> HOME </a></div>"
         )
         ("psnote-static"
             :base-directory "~/psnote_public/"
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|sh\\|el\\|jpeg\\|html"
             :publishing-directory "~/note_site/"
             :recursive t
             :publishing-function org-publish-attachment
          )

	 ("psnote" :components ("psnote-org" "psnote-static"))


        ))




(define-key global-map "\C-cp" 'org-publish)

(provide 'pengshao-org-publish)
