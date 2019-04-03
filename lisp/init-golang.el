(add-hook 'go-mode-hook (lambda()
			  (local-set-key (kbd "C-c C-k") 'godoc)))

(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kbd "C-c p") 'set-go-path)))
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
			  (setq indent-tabs-mode t)))
(add-hook 'go-mode-hook (lambda()
			  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-to-list 'load-path "/opt/gopath/src/github.com/dougm/goflymake")
(require 'go-flymake)

(add-hook 'flymake-mode-hook (lambda()
			       (local-set-key (kbd "C-c C-e n") 'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook (lambda()
			       (local-set-key (kbd "C-c C-e p") 'flymake-goto-prev-error)))
(add-hook 'flymake-mode-hook (lambda()
			       (local-set-key (kbd "C-c C-e m") 'flymake-popup-current-error-menu)))

(add-hook 'go-mode-hook (lambda()
			  (setq indent-tabs-mode 1)
			  (setq tab-width 4)))

(provide 'init-golang)
