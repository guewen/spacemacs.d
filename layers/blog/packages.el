;;; packages.el --- blog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Guewen Baconnier <guewen@anduril>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `blog-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `blog/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `blog/pre-init-PACKAGE' and/or
;;   `blog/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst blog-packages
  '(
    ;;(org-page :location local)
    org-page
    ht
    mustache
    ))
  "The list of Lisp packages required by the blog layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format"

(defun blog/init-org-page ()
  (use-package org-page
    :commands (op/do-publication op/new-post op/new-repository)
    :init
    (spacemacs/set-leader-keys
      "opo" '(lambda () (interactive)
               (magit-status op/repository-directory))
      "opp" '(lambda() (interactive)
               (let ((org-html-htmlize-output-type 'css))
                 (op/do-publication t nil t nil))
               (find-file op/repository-directory))
      "opP" '(lambda() (interactive)
               (let ((org-html-htmlize-output-type 'css))
                 (op/do-publication t t org-page-built-directory))))
    (setq org-html-doctype "html5")
    (setq org-html-html5-fancy t)
    (defface strike-through
      '((t :strike-through t))
      "Basic strike-through face."
      :group 'basic-faces)
    (unless (file-exists-p org-page-built-directory)
      (make-directory org-page-built-directory))
    :config
(push '("+" ,(if (featurep 'xemacs) 'org-table strike-through)) org-emphasis-alist)))

(defun blog/init-mustache ()
  (use-package mustache))

(defun blog/init-ht ()
  (use-package ht))

;;; packages.el ends here
