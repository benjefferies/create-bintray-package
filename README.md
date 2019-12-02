# Create Bintray Package
A Github action to create a Bintray package.

Example of usage can be found https://github.com/benjefferies/maven-bintray-github-actions


## Inputs
```
  bintray-user:
    description: 'Bintray user used for authentication'
    required: true
  bintray-token:
    description: 'Bintray access token used for authentication'
    required: true
  owner:
    description: 'The bintray owner or organisation to create the package under'
    required: true
  repo:
    description: 'The bintray repo to create the package will live under'
    required: true
  package-name:
    description: 'The name of the package to create'
    required: true
  package-description:
    description: 'The description of the package to create'
    required: true
  package-url:
    description: 'The url of the source code'
    required: true
  package-license:
    description: 'The license of the package to create'
    required: true
```
