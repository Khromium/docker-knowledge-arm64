# Dockerfile for Knowledge
FROM khrom/docker-tomcat-arm64

# ==== add Knowledge ====
ADD https://github.com/support-project/knowledge/releases/download/v1.12.0pre1/knowledge.war \
      /tomcat/webapps/ROOT.war
      
# ==== upgrade for security fix ====
RUN apt-get update \
 && apt-get upgrade -y

VOLUME [ "/root/.knowledge" ]
EXPOSE 8080

CMD [ "dumb-init", "/tomcat/bin/catalina.sh", "run" ]

