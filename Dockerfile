FROM kibana:latest

RUN apt-get update && apt-get install -y netcat

COPY ./config/kibana.yml /opt/kibana/config/kibana.yml
COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN kibana plugin --install elastic/sense

CMD ["/tmp/entrypoint.sh"]
