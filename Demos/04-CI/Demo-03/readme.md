# SharePoint Framework Build

Uses SPFx Sample Repo [https://github.com/arambazamba/spfx-devops](https://github.com/arambazamba/spfx-devops)

## Scaffolding & Basics

SPFx (SharePoint Framework) requires [Node 14+](https://nodejs.org/en/download/releases/), Yeoman, Gulp, SPFx Generator SharePoint

```
npm i -g yo gulp @microsoft/generator-sharepoint
```

> Note: Detailed Instructions for Env Setup [here](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/set-up-your-development-environment)

Create proj:

```
yo @microsoft/sharepoint
```

Manual Build:

```
npm i
gulp bundle
gulp package-solution
```

> Note: You might have to switch to node version 10.x
