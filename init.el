;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

(setq gc-cons-threshold 100000000)
(defconst spacemacs-version          "0.104.4" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.3" "Minimal version of Emacs.")

(defun spacemacs/emacs-version-ok ()
  (version<= spacemacs-emacs-min-version emacs-version))

(when (spacemacs/emacs-version-ok)
  (load-file (concat user-emacs-directory "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (require 'core-configuration-layer)
  (spacemacs/init)
  (spacemacs/maybe-install-dotfile)
  (configuration-layer/sync)
  (spacemacs/setup-startup-hook)
  (require 'server)
  (unless (server-running-p) (server-start)))


;; 个人配置
;; =================================
;; 设置字体
;; Setting English Font
(set-face-attribute
 'default nil :font "Consolas 11")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Microsoft Yahei" :size 13)))
;; =================================
;; todo list 默认只有两种状态： TODO 和 DONE。我们可以再增加一些其他状态。比如在.emacs中加入下面的语句:
;; 可以将 todo list 的状态增加为五种：TODO，DOING，HANGUP，DONE，CANCEL。
;; 注意，在 HANGUP 和 DONE 之间有一条竖线 “|”，在竖线之前的状态和之后的状态使用的是不同的face。
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "HANGUP" "|" "DONE" "CANCEL")))

;; 进一步的，我们还可以记录切换到某一种状态时的时间：
;; 在 DOING HANGUP DONE 和 CANCEL 后的括号中都有一个’!'，这种写法表示进入到这些状态后会记录下当前时间。而每个状态后面的括号中都有一个字母，这个字母就是进入该状态的快捷键。当你想切换到某一状态时，可以输入’C-c C-t’（此时 emacs 会弹出一个提示窗口），然后输入对应的快捷键就可以把当前的条目设置为该状态。
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")))


;; 快捷键绑定
;; =================================

(global-set-key (kbd "C-;") 'read-only-mode);只读模式切换
;(global-set-key [M-f1] 'shell);F1进入Shell
;(global-set-key [M-f2] 'python-shell);F2进入Python-Shell
;(global-set-key (kbd "C-`") 'eval-buffer);配置文件生效
;(global-set-key [f5] 'gdb);F5调试程序
;(setq compile-command "make -f Makefile")
;(global-set-key [f7] 'do-compile);F7编译文件
;(global-set-key [f3] 'other-window);F3窗口间跳转
;(global-set-key [f4] 'delete-other-windows);F4 关闭其它窗口
;(global-set-key [C-return] 'kill-this-buffer);C-return关闭当前buffer
;(global-set-key [f1] 'split-window-vertically);F1分割窗口
;(global-set-key (kbd "C-,") 'backward-page);文件首
;(global-set-key (kbd "C-.") 'forward-page);文件尾
