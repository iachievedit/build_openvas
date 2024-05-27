#!/bin/bash
#
echo "+ Go for launch"
systemctl start ospd-openvas
systemctl start gvmd
systemctl start gsad
systemctl start openvasd

systemctl enable ospd-openvas
systemctl enable gvmd
systemctl enable gsad
systemctl enable openvasd
