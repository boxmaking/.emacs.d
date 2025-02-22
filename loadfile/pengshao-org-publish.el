;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-org-publish.el---org-publish相关的配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ox-publish)
(setq org-publish-project-alist
      '(
         ("psnote-org"
             :base-directory "~/public_note/"
             :base-extension "org"
             :publishing-directory "~/public_site/"
             :recursive t     ;是否递归
             :publishing-function org-html-publish-to-html  ;使用哪个函数来进行publish（注：org 7与8在这个地方有区别）
             :headline-levels 2   ;由于大纲结构也用于列表和任务,因此只有前4个级别用作标题更深的级别会被看作项目列表,我设置的2
             :auto-preamble t     ;自动前言
             :section-numbers t ;章节数字是否显示
             :author "pengshao"   ;作者
             :email "pengshao58@gmail.com"   ;邮箱
             :auto-sitemap t                  ; 自动生成 sitemap.org 文件
	     :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
             :sitemap-title "PengShao's BLOG!"         ; ... with title
             ;;:sitemap-file-entry-format "%d %t"   ;这里采用时间+标题的方式生成sitemap 
	     :style-include-default nil  ;禁用默认 css 样式,使用自定义css

	     ;作为一个字符串给予 html-head 变量并插入到生成的 html 文件的head部
	     ;因此里面的某些字符必须避免转义，比如双引号必须加上反斜杠
	     ;href 的赋值不会做如何转换，因此必须确保是在生成的 html 文件能够访问的绝对路径。
	     ;html-home/up-format"<div id=\"org-div-home-and-up\"> <a accesskey=\"h\" href=\"/home/index.html\"> UP </a> | <a accesskey=\"H\" href=\"/home/index.html\"> HOME </a></div>"
             ;html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/home/css/org.css\"/>"
	     ;html-postamble "<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-164487790-1\"></script> <script> window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'UA-164487790-1'); </script>"
	     ;HTML_EXPORT_POSTamble: "<script async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"> </script>
	     
         )



	 ("psnote-static"
             :base-directory "~/public_note/"
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|sh\\|el\\|jpeg\\|html"
             :publishing-directory "~/public_site/"
             :recursive t
             :publishing-function org-publish-attachment
          )


	 ("psnote" :components ("psnote-org" "psnote-static"))


        ))


(define-key global-map "\C-cp" 'org-publish)




(provide 'pengshao-org-publish)
