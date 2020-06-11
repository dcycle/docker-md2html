[![CircleCI](https://circleci.com/gh/dcycle/docker-md2html.svg?style=svg)](https://circleci.com/gh/dcycle/docker-md2html)

Translate markdown to html with [pandoc](https://pandoc.org).

For example:

    docker run --rm -v $(pwd)/example01:/app/code \
      dcycle/md2html:1 -t html5 README.md -o README.html

Example with Drupal
-----

If you manage a project on Drupal.org, you might have a README.md file in your project, but Drupal will not update the project description from the README.md file. It requires you to enter HTML data Directly in its user interface. To help you with this, you might want to add `README.html` to your project's `.gitignore` file, and create a `./scripts/readme2html.sh` script which might contain something like:

    #!/bin/bash
    #
    # Generate html from md. Useful for updating the description on Drupal.
    #
    set -e

    docker pull dcycle/md2html:1
    docker run --rm -v "$(pwd):/app/code" \
      dcycle/md2html:1 -t html5 README.md -o README.html

    # If one enters <code>&gt;</code> in Drupal.org, it is erroneously
    # output as <code class="language-php">&amp;gt;</code>; because we know
    # that this only happens in certain contexts (")->") in our case, we can
    # simply reconvert it to something which will appear correctly in
    # Drupal.org.
    # See https://www.drupal.org/node/3103954
    # To fix it we cannot use sed because it's used differently on different
    # systems, perl seems a good alternative, see
    # https://stackoverflow.com/a/4247319/1207752
    perl -i -pe's/-&gt;/->/g' README.html
    perl -i -pe's/&quot;/"/g' README.html
    perl -i -pe"s/&#39;/'/g" README.html

See [this project on the Docker Hub](https://hub.docker.com/r/dcycle/md2html/).
