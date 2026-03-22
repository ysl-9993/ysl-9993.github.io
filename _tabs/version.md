---
layout: page
title: 版本记录
permalink: /version/
icon: fas fa-history
---

{% assign versions_sorted = site.data.versions | sort: "version" %}
{% assign versions_sorted = versions_sorted | sort: "date" %}
{% assign versions_sorted = versions_sorted | reverse %}
{% assign latest_release = versions_sorted | first %}

## 当前版本

- **版本号**：`{{ site.version }}`
- **更新时间**：{{ latest_release.date }}

## 更新日志

{% for release in versions_sorted %}
### {{ release.version }} · {{ release.date }} · {{ release.title }}

{% if release.summary %}
- {{ release.summary }}
{% endif %}

{% if release.content %}
- 更新内容：

    {% for content in release.content %}
    - {{ content }}
    {% endfor %}
{% endif %}
---
{% endfor %}
