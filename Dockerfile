FROM python:3.10-alpine

WORKDIR /usr/src/app

COPY app.py .
COPY requirements-app.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "-m" , "flask", "run", "--host=0.0.0.0"]