/etc/ntp.conf :
  file.managed:
    - source: salt://ntp.conf.j2

ntp:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/ntp.conf 
    - require:
      - pkg: ntp
