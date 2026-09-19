#!/bin/sh
cat > /app/config.json <<EOF
{
  "log": {"loglevel": "warning"},
  "inbounds": [{
    "port": 8080,
    "protocol": "vmess",
    "settings": {
      "clients": [{"id": "${UUID}"}]
    },
    "streamSettings": {
      "network": "ws",
      "security": "none",
      "wsSettings": {"path": "${WSPATH}"}
    }
  }],
  "outbounds": [{"protocol": "freedom"}]
}
EOF
exec /app/xray run -config /app/config.json
