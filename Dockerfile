FROM castaples/terraform:latest

RUN apk add --update python py-pip openssl ca-certificates groff zip jq curl && \
    pip install --upgrade pip awscli && \
    rm -rf /var/cache/apk/*
    
RUN wget --no-check-certificate -O /usr/bin/json2hcl https://github.com/kvz/json2hcl/releases/download/v0.0.6/json2hcl_v0.0.6_linux_amd64 

ENTRYPOINT ["sh", "-c"]
CMD ["terraform"]
