---
layout: page
permalink: /cv/
title: CV
nav: true
nav_order: 3
nav_new_tab: true
---

<p>
  <a
    class="btn btn-sm z-depth-0"
    role="button"
    href="{{ '/assets/pdf/CV_202608.pdf' | relative_url }}"
    target="_blank"
    rel="noopener noreferrer"
    style="border: 1px solid var(--global-theme-color); color: var(--global-theme-color);"
  >Download CV (PDF)</a>
</p>

<!-- Phone browsers show embedded PDFs poorly or not at all, so the embed is for medium screens and up. -->
<iframe
  class="d-none d-md-block"
  src="{{ '/assets/pdf/CV_202608.pdf' | relative_url }}"
  title="Curriculum Vitae"
  width="100%"
  style="height: 85vh; border: 1px solid var(--global-divider-color);"
>
</iframe>
