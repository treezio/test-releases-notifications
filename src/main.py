#!/usr/bin/python
from flask import Flask

# Instance flask application
application = Flask(__name__)

@application.route('/info', methods=['GET'])
def info():
    response = application.response_class(
        response='v0.1.3',
        status=200,
        mimetype='application/json'
    )
    return response


if __name__ == '__main__':
    application.run()
