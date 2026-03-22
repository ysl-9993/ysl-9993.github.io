---
layout: page
title: 版本
permalink: /version/
---

## 当前版本

- **版本号**：`{{ site.version }}`
- **更新时间**：{% assign latest_release = site.data.versions | first %}{{ latest_release.date }}{% if latest_release.title %}（{{ latest_release.title }}）{% endif %}

## 更新日志

{% for release in site.data.versions %}
### {{ release.version }} · {{ release.date }} · {{ release.title }}

{{ release.summary }}

{% if release.highlights %}
更新亮点：

{% for highlight in release.highlights %}
- {{ highlight }}
{% endfor %}
{% endif %}
---
{% endfor %}
