# Hugo Doks Markdown Converter
![image](https://github.com/user-attachments/assets/c2419a09-9d61-48c9-8a2e-e9e9a6060bf2)

Simple script that will add a title to a normal .md file. The converted file will have a title section which is required so that Doks show it in the static site. The title is generated from the filename.

## Example

### Docs.md
```md
# Getting Started with MyApp

## Installation

To install MyApp, run the following command:

```bash
npm install myapp
```

### Docs.md after running the script
```md
---
title: Docs
---
# Getting Started with MyApp

## Installation

To install MyApp, run the following command:

```bash
npm install myapp
```

*NOTE: The original file will be overwritten*
