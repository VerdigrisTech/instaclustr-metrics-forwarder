FROM datadog/agent:latest

ARG ENVIRONMENT=staging

RUN apt-get update \
  && apt-get install -y jq \
  && apt-get autoremove --purge \
  && apt-get autoclean

WORKDIR /opt/instaclustr-metrics-forwarder

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY ic2datadog.py .
COPY configuration.json .

RUN jq ". + { \"tags\": [\"instaclustr.environment:${ENVIRONMENT}\"] }" configuration.json

CMD ["/init", "/opt/instaclustr-metrics-forwarder/ic2datadog.py"]
