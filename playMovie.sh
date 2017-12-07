!#/sbin/bash
echo "use ./playMovie <path to video file>"

curl -g localhost:8080/jsonrpc?request=\{\"jsonrpc\":\"2.0\",\"method\":\"Player.Open\",\"params\":\{\"item\":\{\"file\":\"$1\"\}\},\"id\":\"1\"\}