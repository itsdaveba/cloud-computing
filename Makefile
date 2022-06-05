venv:
	python3 -m venv venv

install:
	python -m pip install --upgrade pip
	python -m pip install -r requirements.txt

lint:
	python -m pylint --disable=C *.py

test:
	python -m pytest --cov=main

format:
	python -m black *.py

all: install lint test format