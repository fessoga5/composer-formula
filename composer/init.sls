# vim: sts=2 ts=2 sw=2 et ai
{% from "stgserver/map.jinja" import stgserver with context %}

composer-install-pkg:
  pkgrepo.managed:
    - name: {{ stgserver.lookup.apt }}
    - dist: trusty
  pkg.latest:
    - name: {{ stgserver.lookup.pkg-name }} 
    - refresh: True
    - forceyes: True
    - require:
      - pkgrepo: composer-install-pkg 
  cmd.run:
    - name: "composer self-update"
    - require:
      - pkg: composer-install-pkg