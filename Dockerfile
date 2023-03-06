FROM alpine:3.17.2
WORKDIR /data
RUN apk add --no-cache --update curl
RUN curl -sL -o argocd "$(curl -sL https://api.github.com/repos/argoproj/argo-cd/releases/latest |egrep '(browser_download_url.*download.*argocd)'|grep -v 'sha256'|sed 's#^.*\": ##g'|grep amd64 | grep linux |sed -e 's#\"##g')"
RUN chmod +x argocd; mv argocd /bin/
