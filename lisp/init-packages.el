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
			 go-mode
			 auto-complete
			 neotree
			 web-mode
			 js2-refactor
			 expand-region
			 iedit
			 org-pomodoro
			 helm-ag
			 flycheck
			 auto-yasnippet
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
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(require 'hungry-delete)
(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

(global-company-mode t)

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 4) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 4)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 4)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(add-hook 'js2-mode-hook #'js2-refactor-mode)

(load-theme 'spacemacs-dark t)

(require 'popwin)
(popwin-mode t)

(require 'go-mode)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(require 'org-pomodoro)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'go-mode 'flycheck-mode)


(provide 'init-packages)
