FROM python:3.10

# Set Poetry Version
ENV POETRY_VERSION=1.1.13
# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - --version $POETRY_VERSION
# Add poetry install location to PATH
ENV PATH=/root/.local/bin:$PATH

COPY poetry.lock pyproject.toml ./
RUN poetry config virtualenvs.in-project true --local
RUN poetry install --no-dev

COPY post_updater.py ./post_updater.py

CMD ["poetry", "run", "python", "post_updater.py"]
