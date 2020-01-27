FROM python:3.7-slim

RUN pip3 install pipenv

ENV SRC_DIR /usr/local/src/containers-first-steps

WORKDIR ${SRC_DIR}

COPY Pipfile Pipfile.lock ${SRC_DIR}/

RUN pipenv install --system --clear

COPY ./ ${SRC_DIR}/

# This is what is copied:
#     /usr/local/run-gunicorn
COPY files/ /

# Make the above copied file executable.
RUN chmod +x /usr/local/*

WORKDIR ${SRC_DIR}/src

# CMD ["run-gunicorn"]
CMD ["/usr/local/run-gunicorn"]
