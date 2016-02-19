;; 사용자 디렉토리 추가
;;(setq load-path (nconc '("~/.emacs.d") load-path)) ;; load-path

(put 'upcase-region 'disabled nil)
;; lisp파일 경로 설정
(add-to-list 'load-path "~/Dropbox/Config_files/emacs/site-lisp/")
;; C코드에서 4칸 들여쓰기 하기
(setq c-default-style "linux"
          c-basic-offset 4)
;;라인 번호
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(add-hook 'find-file-hook (lambda () (global-linum-mode 1)))
;;(setq make-backup-files nil)

;;백업파일 한곳에 몰아 넣기.
 (setq backup-directory-alist
      	  '(("." . "/home/raven/.emacs.d/backup-files")))

;;한글폰트 작업
(when window-system 
(set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NANumGothicCoding" . "unicode-bmp")) ;;; 유니코드 한글영역...NanumGothicCoding에다가 원하는폰트를 적는다
(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)  '("NanumGothicCoding" . "unicode-bmp")) ;;;유니코드 사용자 영역
(set-fontset-font "fontset-default" 'kana '("Meiryo" . "unicode-bmp"))
(set-fontset-font "fontset-default" 'han '("Microsoft YaHei" . "unicode-bmp"))
)

;; 한글 입력기 키보드 레이아웃
;;(require 'hangul)
;;(setq default-korean-keyboard "korean-hangul3f") ;; 3벌식 최종

;; 라인 넘버
;;(load-library "setnu.el")
;;(add-hook 'c-mode-hook 'turn-on-setnu-mode)
;;(add-hook 'text-mode-hook 'turn-on-setnu-mode)
;;(add-hook 'c++-mode-hook 'turn-on-setnu-mode)

;; 외부에서 수정시 자동 버퍼 다시 읽기
(global-auto-revert-mode 1)

; vim o 키 흉내내기 ; 함수 선언 후 키 맵핑
(defun my-insert-line ()
  "Insert blank line below the cursor."
  (interactive)
  (end-of-line)
  (newline-and-indent))
(global-set-key "\M-o" 'my-insert-line);M-o 는 원래 face바꾸기 임

;emacs tab 설정
(setq c-basic-offset 4
          tab-width 4
          indent-tabs-mode t)
;(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

; 탭 대신 공백 넣기
(setq-default indent-tabs-mode nil)

; c-toggle-auto-state 기능에 backspace입력시 모든 공백(줄 바꿈 포함) 삭제
;(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-hungry-state 1)))

;C 들여쓰기 기본 스타일 설정
(setq c-default-style "k&r")
; (setq c-default-style "cc-mode")
; (setq c-default-style "gnu")
; (setq c-default-style "bsd")
; (setq c-default-style "stroustrup")
; (setq c-default-style "whitesmith")

; 엔터 입력시 자동 들여쓰기 다른 방법
(load "cc-mode")
(define-key c++-mode-map "\r" 'reindent-then-newline-and-indent)
(define-key c-mode-map "\r" 'reindent-then-newline-and-indent)
(define-key java-mode-map "\r" 'reindent-then-newline-and-indent)

; 엔터 입력시 자동 들여쓰기 다른 방법
;(require 'cc-mode)
;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

; { , ; 입력시 자동 줄 추가
;(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

;; C-c c      M-x compile
(global-set-key [(control c) ?c] 'compile)
;; C-c d      M-x shell
(global-set-key [(control c) ?d] 'eshell)
;; C-c C-l     M-x goto-line
(global-set-key [(control c) (control l)] 'goto-line)
;; C-c C-i      M-x indent-region
(global-set-key [(control c) (control i)] 'indent-region)
(require 'cc-mode)
;; M-{      M-x c-beginning-of-defun 
(define-key c-mode-base-map [(meta ?{)] 'c-beginning-of-defun)
;; M-}     M-x c-end-of-defun
(define-key c-mode-base-map [(meta ?})] 'c-end-of-defun)

(global-font-lock-mode t)

(require 'color-theme)
(defun color-theme-djcb-dark ()
  "dark color theme created by djcb, Jan. 2009."
  (interactive)
  (color-theme-install
   '(color-theme-djcb-dark
     ((foreground-color . "#a9eadf")
      (background-color . "black") 
      (background-mode . dark))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (default ((t (nil))))
       
     (font-lock-builtin-face ((t (:italic t :foreground "#a96da0"))))
    ;; (font-lock-comment-face ((t (:italic t :foreground "#bbbbbb")))) 
    ;; (font-lock-comment-face ((t (:italic t :foreground "#6666CDCDAAAA")))) 
     (font-lock-comment-face ((t (:italic t :foreground "#CACAFFFF7070")))) 
     (font-lock-comment-delimiter-face ((t (:foreground "#666666"))))
     (font-lock-constant-face ((t (:bold t :foreground "#197b6e"))))
     (font-lock-doc-string-face ((t (:foreground "#3041c4"))))
     (font-lock-doc-face ((t (:foreground "gray"))))
     (font-lock-reference-face ((t (:foreground "white"))))
     ;;(font-lock-function-name-face ((t (:foreground "#356da0"))))
     (font-lock-function-name-face ((t (:foreground "#FFFF8282ABAB"))))
;;     (font-lock-keyword-face ((t (:bold t :foreground "#bcf0f1"))))
     (font-lock-keyword-face ((t (:bold t :foreground "#FFFFECEC8B8B"))))
     (font-lock-preprocessor-face ((t (:foreground "#e3ea94"))))
     (font-lock-string-face ((t (:foreground "#ffffff"))))
     (font-lock-type-face ((t (:bold t :foreground "#364498"))))
     (font-lock-variable-name-face ((t (:foreground "#FFFFA0A07A7A"))))
     ;;(font-lock-variable-name-face ((t (:foreground "#7685de"))))
     (font-lock-warning-face ((t (:bold t :italic nil :underline nil 
                                        :foreground "yellow"))))
     (hl-line ((t (:background "#112233"))))
     (mode-line ((t (:foreground "#ffffff" :background "#333333"))))
     (region ((t (:foreground nil :background "#555555"))))
     (show-paren-match-face ((t (:bold t :foreground "#ffffff" 
                                       :background "#050505")))))))
(color-theme-djcb-dark)

;; ;;한글 쓸때 도음말 기능 없에기.
;; (global-set-key "\C-\\" 'undefined)
;;   (add-hook 'quail-inactivate-hook 'delete-quail-completions)
;;   (defun delete-quail-completions ()
;;     (when (get-buffer "*Quail Completions*")
;;       (kill-buffer "*Quail Completions*")))
;; (eval-after-load 'quail
;;     '(mapkeys (quail-translation-keymap quail-conversion-keymap)
;;               "C-h"        quail-delete-last-char
;;               "C-?"        quail-delete-last-char
;;               "C-SPC"      set-mark-command
;;               "<f1>"       quail-translation-help
;;               ))

;; eshell coloring
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;printf문에 함수인자 하이라이트
(defvar font-lock-format-specifier-face'font-lock-format-specifier-face
  "Face name to use for format specifiers.")
 
(defface font-lock-format-specifier-face
  '((t (:foreground "LightGoldenrod")))
  "Font Lock mode face used to highlight format specifiers."
  :group 'font-lock-faces)

(add-hook 'c-mode-common-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("[^%]\\(%\\([[:digit:]]+\\$\\)?[-+' #0*]*\\([[:digit:]]*\\|\\*\\|\\*[[:digit:]]+\\$\\)\\(\\.\\([[:digit:]]*\\|\\*\\|\\*[[:digit:]]+\\$\\)\\)?\\([hlLjzt]\\|ll\\|hh\\)?\\([aAbdiuoxXDOUfFeEgGcCsSpn]\\|\\[\\^?.[^]]*\\]\\)\\)"
                                       1 font-lock-format-specifier-face t)
                                      ("\\(%%\\)" 
                                       1 font-lock-format-specifier-face t)) )))


;; 한 줄 복사 단축키 지정
(global-set-key "\C-c\y" "\C-a\C- \C-n\M-w")

;; 윈도우 사이를 M-방향키로 옮겨다닐수 있다.
(windmove-default-keybindings 'meta)

;; 사전 부르기
(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)

;; 파일 스위칭
(require 'cc-mode)
(global-set-key (kbd "<f12>") 'find-counterpart-file)

;; 파일 스위칭
(defun find-counterpart-file ()  
  (interactive)  
  (if (string-equal (file-name-extension buffer-file-name) "h")  
      (let ((filebase (file-name-sans-extension buffer-file-name)))  
        (cond  
         ((file-exists-p (concat filebase ".c"))  
          (find-file (concat filebase ".c"))  
          )  
         ((file-exists-p (concat filebase ".cpp"))  
          (find-file (concat filebase ".cpp"))  
          )  
         ((file-exists-p (concat filebase ".cc"))  
          (find-file (concat filebase ".cc"))  
          )  
         ((file-exists-p (concat filebase ".m"))  
          (find-file (concat filebase ".m"))  
          )  
         ((file-exists-p (concat filebase ".mm"))  
          (find-file (concat filebase ".mm"))  
          )  
         )  
        )  
    (let ((filebase (file-name-sans-extension buffer-file-name)))  
      (if (file-exists-p (concat filebase ".h"))  
          (find-file (concat filebase ".h"))  
        )  
      )  
    )  
  )  

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ede-project-directories
   (quote
    ("/Users/raven" "/home/raven/Dropbox/Study/ARM/AT91SAM7S/AT91SAM7S")))
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(when window-system 
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "나눔고딕코딩")))))
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "나눔고딕코딩")))))

;;GDB가 많은 창을 가짐
(setq gdb-many-windows t)

;; GNU GLOBAL for source taG
(setq load-path (cons "/usr/share/emacs/site-lisp/global/" load-path))
(autoload 'gtags-mode "gtags"
"Minor mode for browsing source code using GLOBAL" t)
(add-hook 'c-mode-common-hook
(lambda () (gtags-mode 1)))

;;gtags 자동 업데이트
(defun djcb-gtags-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
    (let ((olddir default-directory)
          (topdir (read-directory-name  
                    "gtags: top of source tree:" default-directory)))
      (cd topdir)
      (shell-command "gtags && echo 'created tagfile'")
      (cd olddir)) ; restore   
    ;;  tagfile already exists; update it
    (shell-command "global -u && echo 'updated tagfile'")))

;;gtags 키 바인딩
;;(add-hook 'gtags-mode-hook 
  ;;(lambda()

;; (global-set-key "\M-." 'gtags-find-tag)  ; find a tag, also M-.
;; (global-set-key "\M-," 'gtags-find-rtag) ;    
;; (global-set-key "\M-?" 'gtags-pop-stack) ;    
;; (global-set-key "\M-\"" 'gtags-find-file) ;    

(global-set-key "\M-=" 'gtags-find-tag)  ; find a tag, also M-.
(global-set-key "\M-." 'gtags-find-rtag) ;    
(global-set-key "\M-," 'gtags-pop-stack) ;    
(global-set-key "\M-\"" 'gtags-find-file) ;    
(global-set-key "\M-?" 'gtags-find-symbol) ;    


;;에러 메세지를 쉽게 이동하기
(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error) 

;;Speed Bar
(global-set-key [f11] 'speedbar) 

;; GNU GLOBAL for source tag
(setq load-path (cons "/usr/share/emacs/site-lisp/global/" load-path))
(autoload 'gtags-mode "gtags"
"Minor mode for browsing source code using GLOBAL" t)
(add-hook 'c-mode-common-hook
(lambda () (gtags-mode 1)))

;;gtags 자동 업데이트
  (defun gtags-root-dir ()
    "Returns GTAGS root directory or nil if doesn't exist."
    (with-temp-buffer
      (if (zerop (call-process "global" nil t nil "-pr"))
          (buffer-substring (point-min) (1- (point-max)))
        nil)))

  (defun gtags-update ()
    "Make GTAGS incremental update"
    (call-process "global" nil nil nil "-u"))

  (defun gtags-update-hook ()
    (when (gtags-root-dir)
      (gtags-update)))

  (add-hook 'after-save-hook #'gtags-update-hook)

;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: Tou must place this *before* any CEDET component
;; gets activated by another package (Gnus, auth-source, ...).
(add-to-list 'load-path  "~/.emacs.d/site-lisp/cedet/")
(load-file "~/.emacs.d/site-lisp/cedet/cedet-devel-load.el")

;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

;; Enable Semantic
(semantic-mode 1)

;; Enable EDE (Project Management) features
(global-ede-mode 1)


(require 'edit-server)
(edit-server-start)

(require 'cl)

