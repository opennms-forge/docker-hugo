# Hugo Docker Container Image with AsciiDoctor

This repository contains the build instructions to install Hugo from a latest version and AsciiDoctor.
It is mainly used in the OpenNMS project to build the documentation for various projects.

The CI/CD workflows can be found in the `.circleci` directory.

## General Project Information

* CI/CD Status: [![CircleCI](https://circleci.com/gh/opennms-forge/docker-hugo.svg?style=svg)](https://circleci.com/gh/opennms-forge/docker-hugo)
* Container Image Info: [![](https://images.microbadger.com/badges/version/opennms/hugo.svg)](https://microbadger.com/images/opennms/hugo "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/opennms/hugo.svg)](https://microbadger.com/images/opennms/hugo "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/license/opennms/hugo.svg)](https://microbadger.com/images/opennms/hugo "Get your own license badge on microbadger.com")
* CI/CD System: [CircleCI]
* Docker Container Image Repository: [DockerHub]
* Issue- and Bug-Tracking: [GitHub Issues]
* Source code: [GitHub]
* Chat: [IRC] or [Web Chat]
* Maintainer: ronny@opennms.org

## Usage

Requirements:

* Current Docker version
* git

Docker Tags

* `latest` floating tag for a build from latest stable release from Hugo
* to run a specific stable version see the [DockerHub Tag] section

The working directory is `/opt/repo` and can be mounted to get your custom content into the image.
Here is a quick start how to use it

Create a new site in the directory "myNewSite"

```
docker run --rm -v $(pwd):/opt/repo opennms/hugo new site myNewSite
```
     
Install a theme

```
cd myNewSite
cd themes
git clone https://github.com/matcornic/hugo-theme-learn.git
```

Install and configure a demo site
```
cd myNewSite
cp -r themes/hugo-theme-learn/exampleSite/* .
```

Delete the `themesDir="../.."` entry in the `config.toml` file.

Serve the site with

```
docker run --rm -v $(pwd):/opt/repo --publish 1313:1313 opennms/hugo serve --bind="0.0.0.0"
```

... or just build static content in the default `public` directory

```
docker run --rm -v $(pwd):/opt/repo opennms/hugo ""
```

## Bump Hugo Version

Change the version number in the `hugo.version` file and commit and push the changes to GitHub.
The Docker Container Image is built and published with version number on [DockerHub]

[GitHub]: https://github.com/opennms-forge/hugo.git
[GitHub Issues]: https://github.com/opennms-forge/hugo/issues 
[CircleCI]: https://circleci.com/gh/opennms-forge/hugo
[DockerHub]: https://hub.docker.com/r/opennms/hugo
[DockerHub Tag]: https://hub.docker.com/r/opennms/hugo/tags/
[Web Chat]: https://chats.opennms.org/opennms-discuss
[IRC]: irc://freenode.org/#opennms
