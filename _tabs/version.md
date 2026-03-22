---
layout: page
title: 版本记录
permalink: /version/
icon: fas fa-history
---

## 当前版本

- **版本号**：`{{ site.version }}`
- **更新时间**：{% assign latest_release = site.data.versions | first %}{{ latest_release.date }}

## 更新日志

{% for release in site.data.versions | reverse %}
### {{ release.version }} · {{ release.date }} · {{ release.title }}

{% if release.summary %}
- {{ release.summary }}
{% endif %}

{% if release.content %}
- 更新内容：

    {% for highlight in release.content %}
    - {{ content }}
    {% endfor %}
{% endif %}
---
{% endfor %}
