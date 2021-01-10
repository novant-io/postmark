#! /usr/bin/env fan

using build

class Build : build::BuildPod
{
  new make()
  {
    podName = "postmark"
    summary = "Postmark email API for Fantom"
    version = Version("0.1")
    meta = [
      "org.name":     "Novant",
      "org.uri":      "https://novant.io/",
      "license.name": "MIT",
      "vcs.name":     "Git",
      "vcs.uri":      "https://github.com/novant-io/postmark"
    ]
    depends = ["sys 1.0", "util 1.0", "web 1.0"]
    srcDirs = [`fan/`]
    docApi   = true
    docSrc   = true
  }
}
