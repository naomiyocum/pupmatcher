FROM python:3.11

RUN mkdir /pupmatcher

COPY /pupmatcher /pupmatcher
COPY pyproject.toml /pupmatcher 

WORKDIR /pupmatcher 
ENV PYTHONPATH=${PYTHONPATH}:${PWD}

RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

