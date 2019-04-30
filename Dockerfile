FROM datadog/agent:latest

WORKDIR /opt/instaclustr-metrics-forwarder

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY ic2datadog.py .
COPY configuration.json .

CMD ["/init", "/opt/instaclustr-metrics-forwarder/ic2datadog.py"]
