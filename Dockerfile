FROM bash

RUN apk update && \
  apk add curl

ADD pushToBintray.sh /bin/pushToBintray.sh

CMD [ "pushToBintray.sh" ]