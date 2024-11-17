FROM python:3.9

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY my_shell_script.sh .
COPY app.py .

RUN chmod +x /app/my_shell_script.sh

EXPOSE 5000

CMD ["python", "app.py"]