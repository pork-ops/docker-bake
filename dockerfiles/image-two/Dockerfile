FROM alpine:3.20

ARG MESSAGE="hello from image-two"

RUN printf '%s\n' "$MESSAGE" > /message.txt

CMD ["cat", "/message.txt"]
