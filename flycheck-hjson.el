;;; flycheck-hjson.el --- Flycheck: hjson validation support
;; Copyright (C) 2016 Graeme Coupar

;; Author: Graeme Coupar <grambo@grambo.me.uk>
;; Maintainer: Graeme Coupar <grambo@grambo.me.uk>
;; URL: http://github.com/obmarg/flycheck-hjson.el
;; Created: 4th May 2016
;; Version: 0.1
;; Keywords: tools
;; Package-Requires: ((flycheck "0.22"))

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Add hjson linting support to Flycheck.
;;
;; Installation:
;;
;; (eval-after-load 'flycheck '(flycheck-hjson-setup))

;;; Code:

(require 'flycheck)

(defconst python-checker-file
  (concat
    (file-name-directory (or load-file-name buffer-file-name))
    "hjson-checker.py"))

(flycheck-define-checker hjson-python
  "Defines a checker for hjson with hjson-py"
  :command ("python"
            (eval python-checker-file))
  :standard-input t
  :error-patterns
  ((error
    line-start "stdin:" line ":" column ":" (message) line-end))
  :modes hjson-mode)

;;;###autoload
(defun flycheck-hjson-setup ()
  "Setup Flycheck for hjson."
  (add-to-list 'flycheck-checkers 'hjson-python))

(provide 'flycheck-hjson)

;;; flycheck-hjson.el ends here
