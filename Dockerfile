FROM python:3

WORKDIR /usr/src/app

COPY . .

ENTRYPOINT [ "python", "./Simulator.py" ]