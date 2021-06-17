setconf:
  lxc.edited_conf:
    - name: web01
    - lxc_conf:
        - lxc.net.0.ipv4.address: 192.168.10.139/24
        - lxc.net.0.veth.pair: br-web
        - lxc.net.0.ipv4.gateway: auto
    - lxc_conf_unset:
        - lxc.utsname
