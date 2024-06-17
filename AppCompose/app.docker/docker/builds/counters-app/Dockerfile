FROM counters-app:vf1.0.1
ADD ca.crt /usr/local/share/ca-certificates/ca.crt
RUN chmod 644 /usr/local/share/ca-certificates/ca.crt && update-ca-certificates
