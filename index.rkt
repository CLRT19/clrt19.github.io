#lang at-exp racket

(require scribble/html)

(require "pubs.rkt")
(require "lib.rkt")

(define email "linrong.cai@princeton.edu")

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

(define cv-link @file-link["files/CV.pdf"]{CV})

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
 @h1{Linrong (Chris) Cai}
 @div[class: "intro container"]{
  @div[class: "bio"]{
   @span[class: "larger"]{@|email|}
   @p{I'm Linrong (Chris) Cai, a M.S.E. student in Computer Science at
   @a[href: "https://www.princeton.edu/"]{Princeton University}.
   Previously a Math and CS undergraduate at
   @a[href: "https://www.wisc.edu/"]{University of Wisconsin Madison}.
   My current research focuses on reasoning in vision-language models, working with Professor
   @a[href: "https://liuzhuang13.github.io/"]{Zhuang Liu} at Princeton.}
   @;{@p{I have also done research focusing on data-efficient machine learning, foundations
   of ML, and robustness to mixed distributions, learning with
   noise and limited data.}}
   @p{I have done research with Professor
   @a[href: "https://www.jelena-diakonikolas.com"]{Jelena Diakonikolas} and Professor
   @a[href: "https://pages.cs.wisc.edu/~fredsala/"]{Frederic Sala}.
   I am fortunate to be mentored by
   @a[href: "https://gabesarch.me/"]{Gabe Sarch} at Princeton,
   @a[href: "https://dyahadila.github.io"]{Dyah Adila},
   @a[href: "https://nick11roberts.science"]{Nicholas Roberts}, and
   @a[href: "https://nikoszarifis.github.io"]{Nikos Zarifis} at UW-Madison.}
   @p{@a[href: "pages/misc.html"]{Miscellaneous} @entity['middot]
   @;@a[href: "pages/courses.html"]{Courses} @entity['middot]
   @;@|cv-link| @entity['middot]
   @;@a[href: "https://www.linkedin.com/in/clrt19"]{LinkedIn}
   @a[href: "https://github.com/CLRT19"]{GitHub}}
  }
  @img[class: "portrait"
       alt: "Chris Cai picture"
       src: "img/self.jpeg"]
 }

 @h2{Publications}
 @pubs

 @h2{Research}
 @experience-item[
   @list{Research with Professor @a[href: "https://liuzhuang13.github.io/"]{Zhuang Liu}}
   @list{Fall 2025 @entity['ndash] present}
   "Reasoning Vision-Language Models."]
 @experience-item[
   @list{Research with Professor @a[href: "https://www.jelena-diakonikolas.com"]{Jelena Diakonikolas}}
   @list{Summer 2024 @entity['ndash] Spring 2025}
   "Learning with Distribution Mixtures and Noise."]
 @experience-item[
   @list{Research with Professor @a[href: "https://pages.cs.wisc.edu/~fredsala/"]{Frederic Sala}}
   @list{Summer 2022 @entity['ndash] Fall 2024}
   "Weak Supervision, Alignment, and Robustification."]
 @experience-item[
   @list{Madison Experimental Mathematics Lab @entity['mdash] advised by Professor @a[href: "https://www.caglaruyanik.com"]{Caglar Uyanik}}
   "Spring 2022"
   "Studied the probability that two random elements of SL2(Z) generate a free group."]

 @div[class: "exp-header container"]{
  @h2{Education}
  @h2[style: "margin-left: auto"]{@a[href: "pages/courses.html"]{Courses taken}}}
 @education-item["Princeton University" "M.S.E. in Computer Science" @list{Fall 2025 @entity['ndash] Spring 2027}]{
   @p{GPA 4.000/4.000}}
 @education-item["University of Wisconsin Madison" "B.S. in Math & CS" @list{Fall 2021 @entity['ndash] Spring 2025}]{
  @p{GPA 3.974/4.000}}
 @education-item["Tianjin No. 1 High School" "Experimental Class" @list{Fall 2018 @entity['ndash] Spring 2021}]

 @h2{Service}
 @h3{At Princeton}
 @experience-item[
   @list{@a[href: "https://www.cs.princeton.edu/courses/archive/spring26/cos240/"]{COS 240} Preceptor @entity['mdash] Professor @a[href: "https://www.cs.princeton.edu/people/profile/ranr"]{Ran Raz}}
   "Spring 2026"
   ""]
 @experience-item[
   @list{@a[href: "https://www.cs.princeton.edu/courses/archive/fall25/cos240/"]{COS 240} Preceptor @entity['mdash] Professor @a[href: "https://www.cs.princeton.edu/~zdvir/"]{Zeev Dvir}}
   "Fall 2025"
   ""]
 @h3{At Madison}
 @experience-item[
   @list{Math Tutor @entity['mdash] @a[href: "https://www.housing.wisc.edu/undergraduate/experience/academics/#tutoring"]{University Housing}}
   @list{Fall 2024, Spring 2025}
   ""]
 @experience-item[
   @list{@a[href: "https://www.jelena-diakonikolas.com/cs541-s24.html"]{CS 541} (DS Theory @entity['amp] Algorithms) Grader  @entity['mdash] Professor @a[href: "https://www.jelena-diakonikolas.com"]{Jelena Diakonikolas}}
   "Spring 2024"
   ""]
 @experience-item[
   "MATH 475 (Combinatorics) Grader"
   @list{Fall 2023, Spring 2024}
   ""]
 @experience-item[
   "CS 540 (Intro to AI) Peer Mentor"
   @list{Fall 2023, Spring 2024}
   ""]
 @experience-item[
   @list{MATH 435 (Cryptography) Grader @entity['mdash] Professor @a[href: "https://pages.cs.wisc.edu/~bach/bach.html"]{Eric Bach}}
   "Fall 2022"
   ""]
 @h3{Others}

 @experience-item[
   @list{Reviewer: NeurIPS 2025}
   ""
   ""]

 @h2{@a[href: "pages/misc.html"]{Miscellaneous}}

 @p[style: "font-size: 0.75em; color: #999; margin-top: 3em; text-align: center"]{
   Website design adapted from @a[href: "https://www.chajed.io/"]{Professor Tej Chajed}.}
 })

(define doc
  (list @doctype['html]
        @html{
 @|page-head|
 @|page-body|
 }))

(output-xml doc)
