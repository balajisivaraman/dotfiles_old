;;; init-org.el --- Org Mode Customizations. -*- lexical-binding: t -*-

;; Author: Balaji Sivaraman <balaji@balajisivaraman.com>

;; The MIT License (MIT)

;; Copyright (C) 2017 Balaji Sivaraman

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;; My customizations and additional packages for Org Mode.

;;; Code:

(setq
 org-todo-keywords
 '((sequence "TODO(t@/!)"
             "WAITING(w@/!)"
             "APPT(a!)"
             "DELEGATED(l@/!)"
             "STARTED(s!)"
             "|"
             "FEEDBACK(f@/!)"
             "VERIFY(v@/!)"
             "DONE(d@/!)"
             "DEFERRED(r@/!)"
             "CANCELLED(x@/!)"))
 org-agenda-files (quote ("/media/backup/Owncloud/Personal Notes/todo.org"))
 org-archive-location "/media/backup/Owncloud/Personal Notes/archives.org::"
 org-default-notes-file "/media/backup/Owncloud/Personal Notes/notes.org"
 org-agenda-ndays 21
 ;; below setting lists all unscheduled tasks as stuck
 org-stuck-projects '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:")
 org-deadline-warning-days 14
 org-agenda-show-all-dates t
 org-agenda-skip-deadline-if-done t
 org-agenda-skip-scheduled-if-done t
 org-agenda-start-on-weekday nil
 org-reverse-note-order t
 org-log-done 'note)
(use-package org-habit
  :after org
  :config
  (add-to-list 'org-modules 'org-habit))
(setq org-habit-graph-column 100)

(use-package org-bullets
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode t))))

(setq
 org-capture-templates
 '(("t" "Todo" entry (file+headline "/media/backup/Owncloud/Personal Notes/todo.org" "Tasks"))
   ("n" "Note" entry (file "/media/backup/Owncloud/Personal Notes/notes.org"))))

(provide 'init-org)
;;; init-org.el ends here
