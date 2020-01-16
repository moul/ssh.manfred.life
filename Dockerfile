FROM    golang:alpine

RUN     apk add --no-cache links git openssh-keygen
RUN     go get github.com/gliderlabs/sshfront

CMD     ssh-keygen -b 2048 -t rsa -f /tmp/privkey -q -N "" \
 &&     sshfront -d -k /tmp/privkey -p 2222 -- links https://manfred.life

EXPOSE  2222