#lang at-exp racket

(require scribble/html)

(define (named-meta name . content)
  (apply element 'meta name: name content: content))

(define (theorem name . body)
  @div[class: "theorem"]{
    @span[class: "bold"]{Theorem (@|name|). }@body})

(define (definition name . body)
  @div[class: "definition"]{
    @span[class: "bold"]{Definition (@|name|). }@body})

(define (remark . body)
  @div[class: "remark"]{
    @span[class: "bold"]{Remark. }@body})

(define page-head
  @head{
    @title{Cheatsheet - Linrong Cai}
    @meta[charset: "UTF-8"]
    @named-meta["viewport"]{width=device-width, initial-scale=1.0}
    @link[rel: "stylesheet" href: "../assets/main.css"]
    @link[rel: "stylesheet" href: "https://fonts.googleapis.com/css?family=Open+Sans:400,600"]
    @link[rel: "stylesheet" href: "https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css"]
    @script[defer: "defer" src: "https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.js"]{}
    @script[defer: "defer" src: "https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/auto-render.min.js"
            onload: "renderMathInElement(document.body, {delimiters: [{left: '$$', right: '$$', display: true}, {left: '$', right: '$', display: false}]});"]{}
    @style{
      .theorem, .definition, .remark { margin-bottom: 1em; }
      .theorem { border-left: 3px solid #0051c9; padding-left: 0.8em; }
      .definition { border-left: 3px solid #28a745; padding-left: 0.8em; }
      .remark { border-left: 3px solid #999; padding-left: 0.8em; font-style: italic; }
    }
  })

(define page-body
  @body{
    @a[class: "back" href: "../index.html"]{@entity['larr] Back}
    @h1[style: "text-align: center"]{Inequalities Cheatsheet}

    @h2{Basic Inequalities}

    @theorem["AM-GM"]{
      For non-negative reals $a_1, a_2, \ldots, a_n$,
      $$\frac{a_1 + a_2 + \cdots + a_n}{n} \geq \sqrt[n]{a_1 a_2 \cdots a_n}$$
      with equality iff $a_1 = a_2 = \cdots = a_n$.}

    @theorem["Cauchy-Schwarz"]{
      For reals $a_i, b_i$,
      $$\left(\sum_{i=1}^n a_i b_i\right)^2 \leq \left(\sum_{i=1}^n a_i^2\right)\left(\sum_{i=1}^n b_i^2\right)$$
      with equality iff $a_i / b_i$ is constant.}

    @theorem["Jensen's Inequality"]{
      If $f$ is convex and $\lambda_1, \ldots, \lambda_n \geq 0$ with $\sum \lambda_i = 1$, then
      $$f\left(\sum_{i=1}^n \lambda_i x_i\right) \leq \sum_{i=1}^n \lambda_i f(x_i)$$}

    @h2{Probability @entity['amp] Concentration}

    @theorem["Markov's Inequality"]{
      For a non-negative random variable $X$ and $a > 0$,
      $$P(X \geq a) \leq \frac{E[X]}{a}$$}

    @theorem["Chebyshev's Inequality"]{
      For a random variable $X$ with finite mean $\mu$ and variance $\sigma^2$,
      $$P(|X - \mu| \geq k\sigma) \leq \frac{1}{k^2}$$}

    @theorem["Hoeffding's Inequality"]{
      Let $X_1, \ldots, X_n$ be independent with $X_i \in [a_i, b_i]$. Then
      $$P\left(\left|\bar{X} - E[\bar{X}]\right| \geq t\right) \leq 2\exp\left(\frac{-2n^2t^2}{\sum_{i=1}^n (b_i - a_i)^2}\right)$$}

    @h2{Linear Algebra}

    @definition["Positive Definite"]{
      A symmetric matrix $A \in \mathbb{R}^{n \times n}$ is positive definite if $x^T A x > 0$ for all $x \neq 0$.}

    @theorem["Spectral Norm Bound"]{
      For any matrix $A \in \mathbb{R}^{m \times n}$,
      $$\|A\|_2 = \sigma_{\max}(A) \leq \|A\|_F \leq \sqrt{r} \cdot \|A\|_2$$
      where $r = \text{rank}(A)$.}

    @remark{These bounds are tight: equality in $\|A\|_2 \leq \|A\|_F$ holds when $A$ has rank 1.}
  })

(define doc
  (list @doctype['html]
        @html{
    @|page-head|
    @|page-body|
    }))

(output-xml doc)
