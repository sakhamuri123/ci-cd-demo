from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"VERSION 3 - THIS WILL BE ROLLED BACK to VERSION 2")

HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()
