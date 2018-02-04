## Who can write a blogpost?

Members of the `inSileco` team. However there is a extra step: it is quite simple,
members need to fill in a separate `yaml` file per author in the `./data/authors/`
of this repository. The easiest way is to copy/paste one example and to change
the information. For instance let see the information about @KevCaz:

```yaml
given_name: Kevin
family_name: Cazelles
description: "Post-doctoral fellow"
project: "What am I doing"
github: KevCaz
twitter: KCazelles
researchgate: Kevin_Cazelles
website: yourwebsite
orcid: 0000-0001-6619-9874
impactstory: 0000-0001-6619-9874
publons: publons_id
gscholar: https://scholar.google.co.uk/citations?user=xzvcu7cAAAAJ&hl=fr
```

Note that avatars are retrieved from Github accounts.

## How to use Github to publish a post?

All the changes must be added in the `dev` branch which is the default one.
The master branch is where the public version of the website is stored. The
deployment of the website from the `dev` branch to the `master` branch
is handled by Travis, see `.travis.yml` and the travis settings for more information.

For substantial changes in the features of the website we strongly encourage to
create a new branch and create a pull request to add feature. Depending on your
skills you may benefit from a review.
Creating a new branch is also encouraged for new upcoming posts, 


## Naming files

to be added

## Media files format

to be added
