from flask import Flask, request, render_template
app = Flask(__name__, template_folder = 'templates')

@app.route("/tic-tac-toe")
def home():
    return render_template("index.html")