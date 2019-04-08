(with-eval-after-load 'org
  ;; Org 模式相关设定
  (setq org-src-fontify-natively t)
  (setq org-agenda-files '("~/org"))
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)))
  )

(provide 'init-org)
