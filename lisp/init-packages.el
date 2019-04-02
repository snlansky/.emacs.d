;; add common lisp
(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  ;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages") t)
  )

;; add whatever package you want here
(defvar snlan/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 spacemacs-theme
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 popwin
			 ) "Default packages")

(setq package-selected-packages snlan/packages)

(defun snlan/packages-installed-p ()
  (loop for pkg in snlan/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (snlan/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg snlan/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


(global-company-mode t)

(load-theme 'spacemacs-dark t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)