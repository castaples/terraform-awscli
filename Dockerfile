FROM hashicorp/terraform:full

RUN apk add --update python py-pip openssl ca-certificates groff zip jq && \
    pip install --upgrade pip awscli && \
    
    rm -rf /var/cache/apk/*

ENTRYPOINT ["sh", "-c"]
CMD ["terraform"]
