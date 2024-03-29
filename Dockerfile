FROM --platform=linux/amd64 python:3.11-slim
WORKDIR /opt/todolist

ENV PIP_DISABLE_PIP_PIPVERSION_CHEK=on \
    PIP_NO_CACHE_DIR=off \
    PYTHON_PATH=/opt/todolist

RUN pip install poetry
RUN poetry config virtualenvs.create false
COPY poetry.lock .
COPY pyproject.toml .
RUN poetry install
COPY . .

ENTRYPOINT ["bash", "entrypoint.sh"]


CMD ["python", "manage.py", "runserver",   "0.0.0.0:8000"]

EXPOSE 8000