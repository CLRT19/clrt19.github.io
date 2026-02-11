#lang at-exp racket

(require scribble/html)

(require "pubs.rkt")
(require "lib.rkt")

(define email "lcai54@wisc.edu")

(define (named-meta name . content)
  (apply element 'meta name: name content: content))

(define page-head
  @head{
 @title{Chris Cai}
 @meta[charset: "UTF-8"]
 @named-meta["keywords"]{Linrong Cai,Chris Cai,CLRT19,Princeton,computer science,machine learning}
 @named-meta["description"]{M.S.E. student in Computer Science at Princeton University.}
 @named-meta["author"]{Linrong Cai}
 @named-meta["viewport"]{width=device-width, initial-scale=1.0}
 @link[rel: "canonical" href: "https://clrt19.com"]
 @link[rel: "stylesheet" href: "assets/main.css"]
 @link[rel: "stylesheet" href: "https://fonts.googleapis.com/css?family=Open+Sans:400,600"]
 })

(define cv-link @file-link["CV.pdf"]{CV})

(define (experience-item title period description)
  @div[class: "experience"]{
 @div[class: "exp-header container"]{
  @span[class: "pub-title"]{@title}
  @span[class: "exp-date"]{@period}
 }
 @(if (equal? description "") "" @p{@description})
 })

(define (education-item institution degree period . details)
  @div[class: "experience"]{
 @div[class: "exp-header container"]{
  @div{@span[class: "pub-title"]{@institution}
       @(if (equal? degree "")
            ""
            @span[class: "pub-conference"]{(@degree)})}
  @span[class: "exp-date"]{@period}
 }
 @details
 })

(define page-body
  @body{
 @h1{Linrong Cai / Chris Cai}
 @div[class: "intro container"]{
  @div[class: "bio"]{
   @span[class: "larger"]{@|email|}
   @p{I'm Linrong Cai / Chris Cai, a M.S.E. student in Computer Science at
   @a[href: "https://www.princeton.edu/"]{Princeton University}.
   Previously a Math and CS undergraduate at
   @a[href: "https://www.wisc.edu/"]{University of Wisconsin Madison}.
   My current research focuses on reasoning in vision-language models, working with Professor
   @a[href: "https://liuzhuang13.github.io/"]{Zhuang Liu} at Princeton.
   My other research focuses on data-efficient machine learning, foundations
   of ML, and robustness to mixed distributions, emphasizing learning with
   noise and limited data.}
   @p{I have done research with Professor
   @a[href: "https://pages.cs.wisc.edu/~fredsala/"]{Frederic Sala} and Professor
   @a[href: "https://www.jelena-diakonikolas.com"]{Jelena Diakonikolas}.
   I am fortunate to be mentored by
   @a[href: "https://gabesarch.me/"]{Gabe Sarch} at Princeton,
   @a[href: "https://dyahadila.github.io"]{Dyah Adila},
   @a[href: "https://nick11roberts.science"]{Nicholas Roberts}, and
   @a[href: "https://nikoszarifis.github.io"]{Nikos Zarifis} at UW-Madison.}
   @p{@a[href: "misc.html"]{Miscellaneous} @entity['middot]
   @a[href: "courses.html"]{Courses} @entity['middot]
   @|cv-link| @entity['middot]
   @a[href: "https://github.com/CLRT19"]{GitHub} @entity['middot]
   @a[href: "https://www.linkedin.com/in/clrt19"]{LinkedIn}}
  }
  @img[class: "portrait"
       alt: "Chris Cai picture"
       src: "img/self.jpeg"
       width: "200em"
       height: "200em"]
 }

 @h2{Publications}
 @pubs

 @h2{Experience}
 @experience-item[
   @list{Research Assistant with Professor @a[href: "https://liuzhuang13.github.io/"]{Zhuang Liu}}
   @list{Aug 2025 @entity['ndash] present}
   "Working on Reasoning VLM projects."]
 @experience-item[
   @list{Undergraduate Research Assistant with Professor @a[href: "https://www.jelena-diakonikolas.com"]{Jelena Diakonikolas}}
   @list{Jan 2024 @entity['ndash] 2025}
   "Learning with Distribution Mixtures and Noise."]
 @experience-item[
   @list{ML Research Assistant with Professor @a[href: "https://pages.cs.wisc.edu/~fredsala/"]{Frederic Sala}}
   @list{June 2022 @entity['ndash] 2025}
   "Weak Supervision, Alignment, and Robustification."]
 @experience-item[
   @list{Madison Experimental Mathematics Lab @entity['mdash] advised by Professor @a[href: "https://www.caglaruyanik.com"]{Caglar Uyanik}}
   "Spring 2022"
   "Researched the probability that two random elements of SL2(Z) generate a free group."]
 @experience-item[
   @list{Grader for Math 435 Cryptography @entity['mdash] Professor @a[href: "https://pages.cs.wisc.edu/~bach/bach.html"]{Eric Bach}}
   "Fall 2022"
   ""]
 @experience-item[
   @list{Grader for Math 475 Combinatorics @entity['mdash] Professor @a[href: "https://math.wisc.edu/staff/mitchel-keller/"]{Mitch Keller}}
   "Fall 2023"
   ""]

 @h2{Education}
 @education-item["Princeton University" "M.S.E. in Computer Science" @list{2025 @entity['ndash] 2027}]
 @education-item["University of Wisconsin Madison" "B.S. in Math & CS" @list{Sept 2021 @entity['ndash] 2025}]{
  @p{GPA 3.987/4.000 @entity['middot] @a[href: "courses.html"]{Courses taken}}}
 @education-item["Tianjin No. 1 High School" "" @list{Sept 2018 @entity['ndash] July 2021}]
 })

(define doc
  (list @doctype['html]
        @html{
 @|page-head|
 @|page-body|
 }))

(output-xml doc)
