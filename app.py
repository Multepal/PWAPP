# Import installed modules
import os, sys
from flask import Flask, render_template

# Import local modules
base_dir = os.path.abspath(os.path.dirname(__file__))
sys.path.append(base_dir)

# Create application object
app = Flask(__name__)
#app.config.from_object('config')

# Define some things used in the handlers
#projects_dir = app.config['PROJECTS_DIR']
data = dict() # Use to store variables to pass to templates
data['main_menu'] = {
    '/projects': 'Projects'
}

# URL Handlers

@app.route("/")
def hello():
    data['page_title'] = 'Hello'
    return render_template('home.html', **data)

@app.route('/test')
def test():
    return render_template('test.html')

if __name__ == '__main__':
    app.run(debug=True)