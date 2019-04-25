ARG FROM_IMAGE=hashicorp/terraform:full
FROM $FROM_IMAGE

RUN apk add --update python py-pip openssl ca-certificates groff zip jq curl && \
    pip install --upgrade pip awscli && \
    
    rm -rf /var/cache/apk/*

ENTRYPOINT ["sh", "-c"]
CMD ["terraform"]
