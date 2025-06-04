FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py /app
COPY requirements.txt /app
CMD ["python", "app.py"]
