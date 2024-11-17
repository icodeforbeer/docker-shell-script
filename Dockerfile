FROM python:3.9-alpine
   
WORKDIR /app

COPY requirements.txt requirements.txt
COPY my_shell_script.sh my_shell_script.sh
COPY app.py app.py

RUN chmod +x /app/my_shell_script.sh
RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]