ARG FROM_IMAGE=hashicorp/terraform:full
FROM $FROM_IMAGE

RUN apk add --update python py-pip openssl ca-certificates groff zip jq curl && \
    pip install --upgrade pip awscli && \
    
    rm -rf /var/cache/apk/*
    
RUN wget https://github.com/wata727/tflint/releases/download/v0.12.1/tflint_linux_amd64.zip && \
	unzip tflint_linux_amd64.zip -d /usr/local/bin

ENTRYPOINT ["sh", "-c"]
CMD ["terraform"]
