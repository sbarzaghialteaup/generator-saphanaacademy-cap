# generator-saphanaacademy-cap [![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-image]][daviddm-url]
> Yeoman Generator to jump-start Full-Stack Cloud Applications

## Installation

This generator creates projects using [SAP Cloud Application Programming Model](https://cap.cloud.sap/) (CAP)

First, install [Yeoman](http://yeoman.io) and generator-saphanaacademy-cap using [npm](https://www.npmjs.com/)

```bash
npm install -g yo
npm install -g generator-saphanaacademy-cap
```
We assume you have pre-installed [node.js](https://nodejs.org/) and the [Cloud Foundry CLI](https://github.com/cloudfoundry/cli) with the [multiapps](https://github.com/cloudfoundry-incubator/multiapps-cli-plugin) plugin.

In order to build the project ensure [@sap/cds-dk](https://www.npmjs.com/package/@sap/cds-dk) and [Cloud MTA Build Tool (MBT)](https://sap.github.io/cloud-mta-build-tool/) are installed.

This is already the case for SAP Business Application Studio.

If using SAP HANA Cloud ensure you have an instance in the space where you'll be deploying the app.

If using the HTML5 Application Repository ensure you have subscribed to the SAP Launchpad service in the subaccount where you'll be deploying the app.

If enabling Continuous Integration and Delivery (CI/CD) ensure you have subscribed to the Continuous Integration & Delivery service and optionally the Transport Management service in the subaccount where you'll be deploying the app.

Also ensure that you are logged in to the Cloud Foundry CLI and are targeting the org and space into which you want to deploy the app.

To generate your new project:

```bash
yo saphanaacademy-cap
```

To refresh project files for an existing SAP HANA Cloud schema:

```bash
cd <project-folder>
yo saphanaacademy-cap:schema
```

To refresh project files for an existing SAP HANA Cloud HDI Container:

```bash
cd <project-folder>
yo saphanaacademy-cap:hdi
```

To refresh project files for SAP Graph:

```bash
cd <project-folder>
yo saphanaacademy-cap:graph
```

![SAP Business Application Studio](demo.gif)

## Video Tutorials

For hands-on video tutorials click [here](https://www.youtube.com/playlist?list=PLkzo92owKnVwQ-0oT78691fqvHrYXd5oN).

## Getting To Know Yeoman

 * Yeoman has a heart of gold.
 * Yeoman is a person with feelings and opinions, but is very easy to work with.
 * Yeoman can be too opinionated at times but is easily convinced not to be.
 * Feel free to [learn more about Yeoman](http://yeoman.io/).

## License

Copyright (c) 2022 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, Version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.

[npm-image]: https://badge.fury.io/js/generator-saphanaacademy-cap.svg
[npm-url]: https://npmjs.org/package/generator-saphanaacademy-cap
[travis-image]: https://travis-ci.com/saphanaacademy/generator-saphanaacademy-cap.svg?branch=main
[travis-url]: https://travis-ci.com/saphanaacademy/generator-saphanaacademy-cap
[daviddm-image]: https://david-dm.org/saphanaacademy/generator-saphanaacademy-cap.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/saphanaacademy/generator-saphanaacademy-cap
