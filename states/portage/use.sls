# USE flags.
portage-use-flags:
  file.recurse:
    - name: /etc/portage/package.use
    - source: salt://portage/config/package.use
    - template: jinja
    - dir_mode: '0755'
    - file_mode: '0644'
    - user: root
