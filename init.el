
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)    ;; 类似于 package-initialize
(require 'pallet)
(pallet-mode t)      ;; 激活 pallet, 在安装包时将 Cask 文件写入相应信息

(add-to-list 'load-path "~/.emacs.d/lisp")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-golang)
(require 'go-flymake)
(require 'go-flycheck)
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
