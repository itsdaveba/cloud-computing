VENV := venv
PYTHON := ${VENV}/bin/python
PIP := ${VENV}/bin/pip
HOST := localhost

.PHONY: all install run lint test format clean

all: install lint test format

${VENV}/bin/activate: requirements.txt
	python3 -m venv ${VENV}
	${PIP} install --upgrade pip
	${PIP} install -r requirements.txt

install: ${VENV}/bin/activate

run: install
	${PYTHON} -m flask run --host ${HOST}

lint: install
	docker run --rm -i hadolint/hadolint < Dockerfile
	${PYTHON} -m pylint --disable=C *.py

test: install
	${PYTHON} -m pytest --cov=app

format: install
	${PYTHON} -m black *.py

clean:
	rm -rf ${VENV}
	rm -rf __pycache__
	rm -rf .pytest_cache
	rm .coverage