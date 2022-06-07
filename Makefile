VENV := venv
PYTHON := ${VENV}/bin/python
PIP := ${VENV}/bin/pip

.PHONY: install run lint test format all clean


all: install lint test format


${VENV}/bin/activate: requirements.txt
	python3 -m venv ${VENV}
	${PIP} install --upgrade pip
	${PIP} install -r requirements.txt
	

install: ${VENV}/bin/activate


run: install
	${PYTHON} main.py


lint: install
	${PYTHON} -m pylint --disable=C *.py


test: install
	${PYTHON} -m pytest --cov=main


format: install
	${PYTHON} -m black *.py


clean:
	rm -rf ${VENV}
	rm -rf __pycache__
	rm -rf .pytest_cache