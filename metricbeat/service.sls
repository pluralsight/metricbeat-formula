include:
  - metricbeat.install
  - metricbeat.config

start Metricbeat service:
  service.running:
    - name: metricbeat
    - enable: True
    - require:
      - pkg: metricbeat
    {%- if salt['pillar.get']('metricbeat:config') %}
    - watch:
      - file: /etc/metricbeat/metricbeat.yml
    {%- endif %}
