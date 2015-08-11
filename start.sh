#!/bin/sh

service php5-fpm restart

nginx -g "daemon off;"
