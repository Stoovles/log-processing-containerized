# Pre Requisites
[Docker Desktop](https://www.docker.com/products/docker-desktop/)

[Docker Compose](https://docs.docker.com/compose/install/)

# Summary
The goal of this repo is to provide an easy to spin-up environment which provides the ability to test containerized log processing rules. Often times customer's will reach out requesting a log processing rule which does XYZ. Too frequently will TSE's provide the customer with an untested rule which will sometimes work sometimes not. The hope is that TSE's will be able to quickly test a containerized log processing rule prior to providing it to the customer.

This repo is comprised of a Datadog Agent image and a logger image. The logger image is meant to generate logs to be tailed by the Datadog Agent and consequently end up in your Datadog sandbox account. Depending on how the customer is applying log processing rules you will either be applying them to the logger image via docker labels OR via environment variables on the Datadog Agent.

Docker labels will apply only to the logs generated by the logger image, while a log processing environment variable will apply to ALL logs collected by the Datadog Agent.

# Setup
1. Clone the repo
2. `cd log-processing-containerized`
3. Place your Datadog API Key in the `docker-compose.yml`
4. Ask the customer for the raw logs that they would like processing rules applied to. I recommend asking for a log file. Once you have this, copy+paste the logs into `logger/entrypoint.sh`. Bear in mind, special characters may need to be escaped `\` in order for the entrypoint to run properly
5. Determine how the customer would like to apply log processing rules. Within the `docker-compose.yml` I've commented out the two methods they may pick, i.e. envvar via `DD_LOGS_CONFIG_PROCESSING_RULES` OR docker labels. Apply the rules.
6. run `docker-compose build`
7. run `docker-compose up`
8. Navigate to your log explorer and determine if the behavior is as expected. If it is not, run `docker-compose down` and rebuild i.e. `docker-compose up`


# Notes
Although this is a docker environment the same applies to a K8S environment, e.g. pod annotations/Helm envvar. If the customer is applying pod annotations, docker labels will be the equivalent. If the customer is apply helm envvar, Docker Agent envvars will be the equivalent.

Reference our [Datadog Log Processing Documentation](https://docs.datadoghq.com/agent/logs/advanced_log_collection/?tab=configurationfile) when necessary
