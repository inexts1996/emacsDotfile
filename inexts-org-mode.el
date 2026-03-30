;;; inexts-org-mode.el -*- lexical-binding: t; -*-

;; ============================================================
;; 辅助函数
;; ============================================================

(defun my/today-daily-note ()
  "返回今日 Daily Note 的路径，目录和文件不存在则自动创建。"
  (let* ((roam-dir (or (bound-and-true-p org-roam-directory)
                       (expand-file-name "roam/" org-directory)))
         (daily-dir (expand-file-name
                     (or (bound-and-true-p org-roam-dailies-directory) "daily/")
                     roam-dir))
         (file (expand-file-name
                (format-time-string "%Y-%m-%d.org")
                daily-dir)))
    (unless (file-exists-p daily-dir)
      (make-directory daily-dir t))
    (unless (file-exists-p file)
      (with-temp-file file
        (insert (format "#+title: %s\n#+filetags: :daily:\n\n"
                        (format-time-string "%Y-%m-%d")))))
    file))

;; ============================================================
;; org-capture 模板
;; ============================================================

(after! org
  (setq org-capture-templates
        '(;; ─── 原有模板（按类型分文件）────────────────────────────
          ("t" "任务" entry
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

          ;; ─── Daily Note 模板（今日一文，带标签）─────────────────
          ("d" "Daily Note")

          ("dn" "随笔 -> 今日" entry
           (file+headline my/today-daily-note "随笔")
           "* %<%H:%M> %? :note:\n  %U\n"
           :empty-lines 1)

          ("dj" "日记 -> 今日" entry
           (file+headline my/today-daily-note "日记")
           "* %<%H:%M> %? :journal:\n  %U\n"
           :empty-lines 1)

          ("dp" "问题 -> 今日" entry
           (file+headline my/today-daily-note "问题")
           "* %<%H:%M> %? :problem:\n  %U\n"
           :empty-lines 1)))

  ;; agenda 扫描范围（只扫任务，不扫 daily note，保持高效）
  (setq org-agenda-files '("~/org/tasks.org")))

;; ============================================================
;; org-roam 设置
;; ============================================================

(after! org-roam
  (setq org-roam-directory (expand-file-name "roam/" org-directory))
  (setq org-roam-dailies-directory "daily/"))
