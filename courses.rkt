#lang at-exp racket

(require scribble/html)

(define (named-meta name . content)
  (apply element 'meta name: name content: content))

(define (semester name . courses)
  @div[class: "semester"]{
    @span[class: "bold"]{@|name|: }@(add-between courses ", ")})

(define page-head
  @head{
    @title{Courses - Linrong Cai}
    @meta[charset: "UTF-8"]
    @named-meta["viewport"]{width=device-width, initial-scale=1.0}
    @link[rel: "stylesheet" href: "../assets/main.css"]
    @link[rel: "stylesheet" href: "https://fonts.googleapis.com/css?family=Open+Sans:400,600"]
    @style{.semester { margin-bottom: 0.4em; }
           h1 { text-align: center; }
           .back { display: block; margin-bottom: 1em; }}
  })

(define page-body
  @body{
    @a[class: "back" href: "../index.html"]{@entity['larr] Back}
    @h1{Courses Taken}

    @h2{Princeton University}
    @semester["Fall 2025"
      "ECE 524: Foundations for Reinforcement Learning"
      "COS 597K: Frontiers in Deep Learning"]

    @h2{University of Wisconsin-Madison}
    @semester["Spring 2025"
      "CS 639: Deep Learning for Computer Vision"
      "CS 682: Senior Honors Thesis"
      "CS 726: Nonlinear Optimization I"
      "LIS 201: The Information Society"]
    @semester["Fall 2024"
      "CS 839: Advanced Topics in Nonlinear Optimization (Audited)"
      "MATH 514: Numerical Analysis"
      "ECE 561: Probability and Information Theory in ML"
      "CS 839: Foundation Models"
      "CS 681: Honor Thesis"]
    @semester["Spring 2024"
      "CS 639: Foundation of Data Science"
      "ISYE 728: Integer Optimization"
      "CS 537: Introduction to Operating Systems"
      "MATH 473: History of Mathematics"
      "ENGL 182: Literature For Honors"]
    @semester["Fall 2023"
      "MATH 721: Real Analysis"
      "MATH 632: Stochastic Processes"
      "MATH 551: Topology"
      "CS 839: Learning based Image Synthesis and Manipulation"
      "CS 525: Linear Optimization"
      "PHILOS 211: Introduction to Logic"]
    @semester["Spring 2023"
      "MATH 522: Analysis II"
      "MATH 531: Probability Theory"
      "MATH 541: Modern Algebra I"
      "CS 564: Database Management Systems"
      "ASIAN 371: Confucius' Analects"]
    @semester["Fall 2022"
      "MATH 521: Analysis I"
      "CS 540: Introduction to AI"
      "CS 532: Matrix Methods in Machine Learning"
      "CS 577: Introduction to Algorithms"
      "MATH 431: Introduction to the Theory of Probability"
      "CS 699: Directed Study"]
    @semester["Summer 2022"
      "MATH 435: Introduction to Cryptography"
      "CS 354: Machine Organization and Programming"
      "ESL 118: Academic Writing II"]
    @semester["Spring 2022"
      "MATH 376: Multivariable Calculus and Differential Equations"
      "CS 400: Programming III"
      "CS 368: Programming Language C++"
      "MATH 475: Introduction to Combinatorics"
      "MATH 490: Madison Experimental Mathematics Lab (MXM)"
      "LIS 202: Informational Divides"]
    @semester["Winter 2022"
      "BIO 101: General Biology"]
    @semester["Fall 2021"
      "MATH 375: Multivariable Calculus and Linear Algebra"
      "CS 300: Programming II"
      "CS 252: Introduction to Computer Engineering"
      "ECON 101: Principles of Microeconomics"
      "ENVIR 205: Our Planet, Our Health"]
  })

(define doc
  (list @doctype['html]
        @html{
    @|page-head|
    @|page-body|
    }))

(output-xml doc)
