ARG FROM_IMAGE=hashicorp/terraform:full
FROM $FROM_IMAGE

ENV USER=ci-user
ENV GROUP=ci-group

RUN apk add --update python py-pip openssl ca-certificates groff zip jq curl && \
	pip install --upgrade pip awscli==1.18.113 \
	terraform-compliance==1.3.0  && \
    
    rm -rf /var/cache/apk/*
    
RUN wget https://github.com/terraform-linters/tflint/releases/download/v0.18.0/tflint_linux_amd64.zip && \
	unzip tflint_linux_amd64.zip -d /usr/local/bin
	
RUN addgroup -S "$GROUP" && \
	adduser -S "$USER" -G "$GROUP"
	
USER "$USER"

ENTRYPOINT ["sh", "-c"]
CMD ["terraform"]
