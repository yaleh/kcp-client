# kcp-client

## Example

```bash
docker run -d -p 3334:1083/tcp --name kcp \
    -e "SERVER=KCPTUN_SERVER" \
    -e "SERVER_PORT=KCPTUN_SERVER_PORT" \
    -e "KCP_PASSWORD=KCPTUN_PASSWORD" \
    -e "CRYPT=aes" 
    yaleh/kcp-client
```

