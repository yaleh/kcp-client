# kcp-client

A KCPTUN client in Docker.

## Example

```bash
docker run -d -p 3334:1083/tcp --name kcp \
    -e "SERVER=KCPTUN_SERVER" \
    -e "SERVER_PORT=KCPTUN_SERVER_PORT" \
    -e "KCP_PASSWORD=KCPTUN_PASSWORD" \
    -e "CRYPT=aes" 
    yaleh/kcp-client
```

## Parameters

* Exported port: 1083/tcp. Local listening port.
* `SERVER`: KCPTUN server address.
* `SERVER_PORT`: KCPTUN server port.
* `KCP_PASSWORD`: KCPTUN pre-shared secret.
* `CRYPT`: KCPTUN crypt.

