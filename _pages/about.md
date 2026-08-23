---
layout: about-rail
title: about
permalink: /
subtitle: Behavioural and experimental economics

profile:
  align: left
  image: prof_pic.jpg
  image_circular: false
  image_alt: Orestis Kopsacheilis
  address: >
    Department of Economics<br>
    Rethymno, Crete, Greece

affiliation: >
  Assistant Professor of Economics<br>
  University of Crete

social: true
selected_papers: false

announcements:
  enabled: false

latest_posts:
  enabled: false
---

<section id="about" class="page-section" markdown="1">

<h2 class="section-heading">About</h2>

I am an economist specialising in behavioural and experimental economics. My research focuses on decisions under risk and uncertainty in individual and social contexts, with applications to medical decision making. Central to this line of work is the *description–experience* framework: whether probabilities are described up front or learned through experience changes the choices people make, even when the odds are identical. My work has helped bring this framework, first developed in psychology, into economics (see [this interview](https://youtu.be/YrwYHErU0zc?si=Dmm1AwLijwxdTemh) for an overview). A second strand asks how individual judgments pool into reliable collective assessments, including in matters of subjective taste (see [this podcast](https://youtu.be/-rFXLK5Ujko?si=0bK_gC3AI1rv3gz5) for an informal take on that work). I am also interested in methodological challenges of preference elicitation, incentive design and model estimation, with the aim of building more accurate and more predictive models of economic behaviour. I pursue these questions through laboratory, online and field experiments.

Currently, I am an Assistant Professor in the Department of Economics at the [University of Crete](https://economics.soc.uoc.gr/). Previously I was a postdoctoral researcher at the [Technical University of Munich](https://eco.cs.tum.de/en/team/personnel). I obtained my PhD in 2019 from the University of Nottingham and remain an external fellow of the Centre for Decision Research and Experimental Economics ([CeDEx](https://www.nottingham.ac.uk/cedex/)).

</section>

<section id="research" class="page-section">

<h2 class="section-heading">Research</h2>

<div class="publications">

<h3 class="bibliography">Published Research Articles</h3>
{% bibliography --group_by none --query @*[keywords=refereed]* %}

<h3 class="bibliography">Consortium Co-Authorship</h3>
{% bibliography --group_by none --query @*[keywords=consortium]* %}

<h3 class="bibliography">Work in Progress</h3>

<h4 class="bibliography-subheading">Papers in Submission / Under Review</h4>
{% bibliography --group_by none --query @*[keywords=submission]* %}

<h4 class="bibliography-subheading">Papers in Preparation</h4>
{% bibliography --group_by none --query @*[keywords=preparation]* %}

</div>

</section>

<section id="teaching" class="page-section">

<h2 class="section-heading">Teaching</h2>

<div class="courses">
  {% assign courses = site.data.courses %}
  {% for course in courses %}
    <div class="row course">
      <div class="col col-sm-2 course-cover">
        {%
          include figure.liquid
          loading="lazy"
          path=course.cover
          sizes="150px"
          class="preview z-depth-1 rounded"
          alt=course.cover_alt
        %}
      </div>
      <div class="col-sm-8">
        <div class="course-title">{{ course.title }} ({{ course.level }})</div>
        <div class="course-meta">{{ course.term }} &middot; {{ course.institution }}</div>
      </div>
    </div>
  {% endfor %}
</div>

</section>
