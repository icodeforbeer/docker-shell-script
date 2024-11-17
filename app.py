from flask import Flask
import subprocess

app = Flask(__name__)

@app.route("/")
def run_script():
    result = subprocess.run(["./my_shell_script.sh"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return f"Output: {result.stdout.decode()}\nError: {result.stderr.decode()}"

# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=80)
