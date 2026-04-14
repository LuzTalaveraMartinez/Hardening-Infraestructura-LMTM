#!/bin/bash
FECHA=$(date +%Y-%m-%d)
/usr/bin/lynis audit system --quick > /var/log/lynis_report_$FECHA.txt
