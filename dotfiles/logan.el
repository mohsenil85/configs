(evil-mode 1)

;; helm stuff
;; taken from tuhdo.github.io
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
                                        ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
                                        ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action)
                                        ; list actions using C-z
(global-set-key (kbd "C-c h s") 'helm-occur)
(global-set-key (kbd "C-h a") 'helm-apropos)
(global-set-key (kbd "C-x r a") 'helm-register)


(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t
      helm-autoresize-mode t
      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match    t
      helm-buffers-fuzzy-matching t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t
      helm-locate-fuzzy-match t
      helm-apropos-fuzzy-match t
      helm-lisp-fuzzy-completion t
)

(add-to-list 'helm-sources-using-default-as-input 'helm-c-source-man-pages)


(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

(persistent-scratch-setup-default)

(load-theme 'sanityinc-tomorrow-night t)

(require 'helm-descbinds)
(helm-descbinds-mode)

(defun last-term-buffer (l)
  "return most recently used term buff"
  (when l
    (if (eq 'term-mode (with-current-buffer (car l) major-mode))
        (car l) (last-term-buffer (cdr l)))))

(defun get-term ()
  "switch to last term buffer or create new one"
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
    (if (or (not b) (eq 'term-mode major-mode))
        multi-term)
      (switch-to-buffer b)))




(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))



;(workgroups-mode 1) ;slow af

(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-dired)

(tooltip-mode -1)
(setq tooltip-use-echo-area t)


(require 'powerline)
(powerline-vim-theme)
