(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;; M-x mgt for magit-status
(defalias 'mgt 'magit-status)

;;; M-x gtl for goto-line
(defalias 'gtl 'goto-line)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;;; auto-complete-modeを有効にする
(global-auto-complete-mode t)

;;; 方向キーを無効にする
(mapc 'global-unset-key '([left] [right] [up] [down]))

;;; php-mode
(add-hook 'php-mode-hook
         (lambda ()
             (require 'php-completion)
             (php-completion-mode t)
             (when (require 'auto-complete nil t)
             (make-variable-buffer-local 'ac-sources)
             (add-to-list 'ac-sources 'ac-source-php-completion)
             (auto-complete-mode t))))

(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))

(add-hook 'php-mode-hook 'helm-gtags-mode)
