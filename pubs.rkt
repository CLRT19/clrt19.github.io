#lang at-exp racket

(require racket/format)
(require syntax/parse/define)
(require scribble/html)
(require "lib.rkt")

;; Publication data representations

(struct conf  (fullname short to-appear?))
(define/contract (mk-conference name short #:to-appear? [to-appear? #f])
  (->* (any/c string?)
       (#:to-appear? boolean?)
       conf?)
  (conf (format "~a (~a)" name short) short to-appear?))

(struct pub (key title conference slides? video-url url authors)
  #:constructor-name mk-publication)
(define/contract (mk-pub
                  key
                  #:title title
                  #:conference conference
                  #:slides? [slides? #f]
                  #:video-url [video-url null]
                  #:url [url null]
                  #:authors authors)
  (->* (string?
        #:title any/c
        #:conference conf?
        #:authors (listof any/c))
       (#:slides? boolean?
        #:video-url (or/c string? null)
        #:url (or/c string? null))
       pub?)
  (mk-publication key title conference slides? video-url url authors))
(define (pub-published? pub)
  (not (conf-to-appear? (pub-conference pub))))

;; HTML formatting for publications

(define (html/conf conference)
  (-> conf? any/c)
  (let* ([short (conf-short conference)]
         [long (conf-fullname conference)]
         [abbrv-conf (if (equal? long "")
                       @short
                       (@abbr[title: long]{@short})
                       )])
    @span[class: "pub-conference"]{
 (@(if (conf-to-appear? conference)
       @list{conditionally accepted to @abbrv-conf}
       abbrv-conf))
 }))

(define/contract (html/pub-title pub)
  (-> pub? any/c)
  (let ([key (pub-key pub)]
        [title (pub-title pub)]
        [url (pub-url pub)])
    @div{
 @span[class: "pub-title"]{
  @(cond
     [url (a 'href: url title)]
     [(pub-published? pub) (file-link @~a{papers/@|key|.pdf} title)]
     [else title])
 }
 @nbsp
 @html/conf[(pub-conference pub)]
 }))

(define-simple-macro (ifdef cond:expr body:expr ...)
  (if cond (list body ...) ""))

(define/contract (html/pub-links pub)
  (-> pub? any/c)
  (let ([key (pub-key pub)]
        [url (pub-url pub)])
    @ifdef[(or url (pub-published? pub))]{
 @div[class: "pub-links"]{
  @a[href: (or url @~a{papers/@|key|.pdf})]{
   @img[title: "Paper" 'alt: "paper icon"
        src: "assets/file.svg" 'height: 16 'width: 16]
  }
  @ifdef[(pub-slides? pub)]{
   @file-link[@~a{papers/@|key|-slides.pdf}]{
    @img[title: "Slides" 'alt: "slides icon"
         src: "assets/slides.svg" 'height: 16 'width: 16]
  }}
  }}))

(define/contract (html/authors pub)
  (-> pub? any/c)
  (add-between (pub-authors pub) ", " #:before-last ", and "))

(define/contract (html/pub pub)
  (-> pub? any/c)
  @div[class: "pub"]{
 @div[class: "pub-header container"]{
  @html/pub-title[pub]
  @html/pub-links[pub]
 }
 @html/authors[pub]
 })

;; The publication list

(provide pubs)
(define (pubs)
  (let* ([chris* @span[class: "self-author"]{Linrong Cai*}]
         [chris @span[class: "self-author"]{Linrong Cai}]

         [pub-list
          (list
            (mk-pub "boxwrench:neurips2024"
                    #:title "Stronger Than You Think: Benchmarking Weak Supervision on Realistic Tasks"
                    #:conference (mk-conference
                                  "Conference on Neural Information Processing Systems, Datasets and Benchmarks Track"
                                  "NeurIPS 2024 D&B")
                    #:url "https://clrt19.com/boxwrench"
                    #:authors (list chris* "Tianyi Zhang*" "Nicholas Roberts" "Jeffrey Li" "Neel Guha" "Frederic Sala"))
            (mk-pub "zero-shot-robust:iclr2024"
                    #:title "Zero-Shot Robustification of Zero-Shot Models"
                    #:conference (mk-conference
                                  "International Conference on Learning Representations"
                                  "ICLR 2024")
                    #:url "https://arxiv.org/pdf/2309.04344"
                    #:authors (list "Dyah Adila*" "Changho Shin*" chris "Frederic Sala"))
           )])
    (map html/pub pub-list)))
