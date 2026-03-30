;;; org-mode.el -*- lexical-binding: t; -*-

;; org-capture 模板
(after! org
  (setq org-capture-templates
        '(("t" "任务" entry
           (file+headline "~/org/tasks.org" "收件箱")
           "* TODO %?\n  SCHEDULED: %t\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n"
           :empty-lines 1)

          ("n" "随笔" entry
           (file+headline "~/org/inbox.org" "随笔")
           "* %?\n  %U\n"
           :empty-lines 1)

          ("j" "日记" entry
           (file+olp+datetree "~/org/journal.org")
           "* %?\n  %U\n"
           :empty-lines 1)

          ("p" "问题" entry
           (file+olp+datetree "~/org/problems.org")
           "* %?\n  %U\n"
           :empty-lines 1)

          ))

  ;; agenda 扫描范围
  (setq org-agenda-files '("~/org/tasks.org")))
