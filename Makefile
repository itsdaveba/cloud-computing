venv:
	python3 -m venv venv

install:
	python -m pip install --upgrade pip
	python -m pip install -r requirements.txt

format:
	python -m black *.py

lint:
	python -m pylint --disable=C *.py

test:
	python -m pytest --cov=hello

all: install lint test