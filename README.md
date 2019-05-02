# instaclustr-metrics-forwarder

[![Build][circleci-badge]][circleci-url]
[![License][license-badge]][license-url]

Provides a simple integration script to push data from the Instaclustr Monitoring REST API to
DataDog.

For detailed instructions on how to set up see:
[Using the Instaclustr Monitoring API with Data Dog][ic-instructions-url].

## Docker support

Main difference between this repository and the official Instaclustr repository is containerization
support. Some of the configuration options that were in the [`configuration.json`](configuration.json)
have also been moved to environment variables.

### Building image

This image takes in a single build argument for determining how the environment is tagged. If
omitted, it will default to `staging`.

#### Build arguments

| Build argument | Required? | Default Value |  Type  |
|:---------------|:---------:|:--------------|:------:|
| `ENVIRONMENT`  |     N     | `staging`     | String |

To build an image for production environment run:

```console
docker build --build-arg ENVIRONMENT=production -t my-repo/instaclustr-metrics-forwarder .
```

### Running image

The image requires environment variables below to be able to run.

#### Environment variables

| Environment variable | Required? | Default Value |  Type  |
|:---------------------|:---------:|:--------------|:------:|
| `DD_API_KEY`         |   **Y**   | `""`          | String |
| `DD_APP_KEY`         |   **Y**   | `""`          | String |
| `DD_TAGS`            |     N     | `""`          | String |
| `IC_USERNAME`        |   **Y**   | `""`          | String |
| `IC_API_KEY`         |   **Y**   | `""`          | String |
| `IC_CLUSTER_ID`      |   **Y**   | `""`          | String |

To run the image, run:

```console
docker run --name ic2dd --rm -v /var/run/docker.dock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY=<DataDog API Key> -e DD_APP_KEY=<DataDog App Key> -e DD_TAGS="instaclustr.key1:value1,instaclustr.key2:value2" -e IC_USERNAME=<Instaclustr Username> -e IC_API_KEY=<Instaclustr API Key> -e IC_CLUSTER_ID=<Instaclustr Cluster GUID> my-repo/instaclustr-metrics-forwarder:latest
```

## LICENSE

This repository was forked from [ICAPI-DataDog][upstream-url] repository which was originally
licensed under [GNU Public License v2][license-url].

## 📣 We’re Hiring!

Do you have passion for solving challenging engineering problems? You may just be the right fit at Verdigris! We are hiring software engineers for our [Mountain View, California, USA](verdigris-location) office.

### Open Positions

* [Product Manager](https://jobs.lever.co/verdigris/bd472be8-df8e-48e9-952a-ad803c44c02f?source=GitHub) — [Apply](https://jobs.lever.co/verdigris/bd472be8-df8e-48e9-952a-ad803c44c02f/apply?source=GitHub)
* [Technical Lead - Software Engineer](https://jobs.lever.co/verdigris/c65cd690-a7bd-4ab6-ab16-16a34888181b?source=GitHub) — [Apply](https://jobs.lever.co/verdigris/c65cd690-a7bd-4ab6-ab16-16a34888181b/apply?source=GitHub)

For more information, check out our [Careers](verdigris-careers) page.

---

<sub>Copyright © 2019 Verdigris Technologies Inc. All rights reserved.</sub>

<sub>Instaclustr is trademark ofInstaclustr Pty Limited. Datadog, its logos and service marks are
the property of Datadog.</sub>

[circleci-badge]: https://img.shields.io/circleci/project/github/VerdigrisTech/instaclustr-metrics-forwarder.svg?style=flat-square
[circleci-url]: https://circleci.com/gh/VerdigrisTech/instaclustr-metrics-forwarder
[license-badge]: https://img.shields.io/github/license/VerdigrisTech/instaclustr-metrics-forwarder.svg?style=flat-square&color=blue
[license-url]: LICENSE
[ic-instructions-url]: https://support.instaclustr.com/hc/en-us/articles/215566468
[ic-open-source-project-status-url]: https://www.instaclustr.com/support/documentation/announcements/instaclustr-open-source-project-status/
[upstream-url]: https://github.com/instaclustr/ICAPI-DataDog
