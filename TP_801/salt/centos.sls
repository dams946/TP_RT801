web121:
  lxc.present:
    - template: download
    - options:
        dist: ubuntu
        release: bionic
        arch: amd64
setconf:
  lxc.edited_conf:
    - name: web12
    - lxc_conf:
        - lxc.net.0.ipv4.address: 192.168.10.165/24
        - lxc.net.0.veth.pair: br-web12
        - lxc.net.0.ipv4.gateway: auto
    - lxc_conf_unset:
        - lxc.utsname
