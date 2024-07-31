#include "fcgi_stdio.h"
#include <stdio.h>


int main() {
    int count = 0;
    while (FCGI_Accept() >= 0) //creates pointers to streams of input, output and errors
        printf("Content-type: text/html\r\n"
               "\r\n"
               "<title>FastCGI Hello World!</title>"
               "<h1>FastCGI Hello World!</h1>"
               "Request number %d running on host <i>%s</i>\n",
               ++count, "nginx.conf");
    return 0;
}