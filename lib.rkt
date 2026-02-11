#lang at-exp racket

(require scribble/html)

(define (check-path-exists path)
  (unless (file-exists? path)
    (raise-user-error @~a{attempt to link to non-existent file @path})))

(define (file-link fname . text)
  (check-path-exists fname)
  (apply a 'href: fname text))
(provide file-link)
