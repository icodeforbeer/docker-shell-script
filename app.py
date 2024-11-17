from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/push_meta/<objname>', methods=['GET'])
def run_script(objname):
    try:
        result = subprocess.run(["./my_shell_script.sh", "-o", objname], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return f"Output: {result.stdout.decode()}", 200
    except subprocess.CalledProcessError as e:
        return f'Script execution failed: {e}', 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
