(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t )


(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)


                                        ;(dolist (p my-packages)
                                        ;  (when (not (package-installed-p p))
                                        ;    (package-install p)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/local/")
(load-theme 'tao t)

(global-aggressive-indent-mode 1)
(global-set-key (kbd "C-x o") 'switch-window)

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-k")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "C-x b")  'helm-mini) ; list actions using C-z
(global-set-key (kbd "C-x C-f")  'helm-find-files) ; list actions using C-z
(global-set-key (kbd "M-x")  'helm-M-x) ; list actions using C-z
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h a") 'helm-apropos)
(setq helm-apropos-fuzzy-match t)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(setq helm-M-x-fuzzy-match t)
(helm-autoresize-mode 1)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(setq helm-lisp-fuzzy-completion t)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))
(setq helm-locate-fuzzy-match t)
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "C-k")  'helm-next-source) ; list actions using C-z

(helm-mode 1)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(require 'helm-ls-git)


                                        ;(require 'ido-vertical-mode)
                                        ;(ido-mode 1)
                                        ;(ido-vertical-mode 1)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;    ;;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
(setq inferior-lisp-program "/usr/bin/sbcl")
(load (expand-file-name "~/projects/lisp/quicklisp/slime-helper.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tao)))
 '(custom-safe-themes (quote ("4ff23437b3166eeb7ca9fa026b2b030bba7c0dfdc1ff94df14dfb1bcaee56c78" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "97fadbcf6a5c8b2755688acd2e25394f5f63740105ed5e3870f06a058d93308a" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "42ccd5eadda3546a89026b94794df7f4addadf25417b96917cf9db2f892b25a4" "d5de5ffdc352e765d4cdf02716941d932b9587dc2f768912e123cde24221b77e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "90e4b4a339776e635a78d398118cb782c87810cb384f1d1223da82b612338046" "fe6330ecf168de137bb5eddbf9faae1ec123787b5489c14fa5fa627de1d9f82b" default)))
 '(dired-listing-switches "-lart")
 '(global-rainbow-delimiters-mode t)
 '(highlight-symbol-colors (quote ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors (if (eq variant (quote light)) (quote (("#FFA726" . 0) ("#FFEE58" . 10) ("#FFF59D" . 30) ("#494949" . 60) ("#424242" . 80))) (quote (("#F8BBD0" . 0) ("#FF80AB" . 10) ("#9575CD" . 30) ("#494949" . 60) ("#424242" . 80)))))
 '(initial-buffer-choice t)
 '(initial-scratch-message ";; scratch 

")
 '(pos-tip-background-color "#3a3a3a")
 '(pos-tip-foreground-color "#9E9E9E")
 '(scheme-program-name "csi -:c")
 '(tabbar-background-color "#353535"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#0E0E0E" :foreground "#D9D9D9" :box (:line-width 1 :style released-button) :height 86)))))

(defun slime-tab ()p
  "slime-mode tab dwim, either indent, complete symbol or yas/expand"
  (interactive)
  (let ((r (slime-indent-and-complete-symbol)))
    (unless r
      (yas/expand))))

(defun my-slime-mode-hook ()
  (interactive)
  (define-key slime-mode-map (kbd "<tab>")
    'slime-tab)
  )
(add-hook 'slime-mode-hook 'my-slime-mode-hook)

(powerline-default-theme)

(eval-after-load 'shell
  '(progn
     (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
     (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
     t))


(defalias 'yes-or-no-p 'y-or-n-p)

(evil-mode 1)

(setq x-select-enable-clipboard t)

(setq helm-candidate-number-limit 100)
;; From https://gist.github.com/antifuchs/9238468
(setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
      helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
      helm-quick-update t
      helm-M-x-requires-pattern nil
      helm-ff-skip-boring-files t)

(setq projectile-switch-project-action 'helm-projectile-find-file)
(setq projectile-switch-project-action 'helm-projectile)

                                        ;(setq projectile-enable-caching t)

