# DUMMY CI-CD PIPELINE

CI-CD Pipeline is a Jenkinsfile for creating a dummy Pipeline on Jenkins with several steps.
At the end it performs a post action to upload a json file to a S3 Bucket with several metrics and data about the current execution.

Original version of this project was based on this repository of [agcandil](https://github.com/agcandil-atsistemas/ci-pipelines). Thanks!

## Prerequisites

1 - Se necesita aprobar las siguientes signatures para su ejecución por scripts en Jenkins:
  - method org.jenkinsci.plugins.workflow.support.actions.EnvironmentAction getEnvironment
  - new java.io.File java.lang.String
  - staticMethod groovy.json.JsonOutput toJson java.lang.Object
  - staticMethod org.codehaus.groovy.runtime.DefaultGroovyMethods write java.io.File java.lang.String

2 - Crear un bucket de S3 con el nombre qué se prefiera

3 - Sustituir en Jenksfile la variable s3BucketName por el nombre del bucket creado

4 - Crear un IAM User en la cuenta de AWS con permisos suficientes para hacer PUT sobre el bucket creado.

## Usage



## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
