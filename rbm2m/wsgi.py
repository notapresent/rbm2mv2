# -*- coding: utf-8 -*-
import os

from rbm2m import middleware
from rbm2m.webapp import create_app

app = create_app(app_env)
app.wsgi_app = middleware.ReverseProxied(app.wsgi_app)

if __name__ == "__main__":
    app.run(
        host=os.environ.get('IP', '0.0.0.0'),
        port=int(os.environ.get('PORT', 8080))
    )
