[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-rdir.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-rdir)
# Ansible role `rdir`

An Ansible role for OpenIO rdir. Specifically, the responsibilities of this role are to:

- install and configure rdir

## Requirements

- Ansible 2.4+

## Role Variables


| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_rdir_bind_address` | `openio_bind_address | default(hostvars[inventory_hostname]['ansible_' + openio_rdir_bind_interface]['ipv4']['address'])` | Address IP to use |
| `openio_rdir_bind_interface` | `"ansible_default_ipv4.alias"` | Interface to use |
| `openio_rdir_bind_port` | `6300` | Listening PORT |
| `openio_rdir_gridinit_dir` | `"/etc/gridinit.d/{{ openio_rdir_namespace }}"` | Path to copy the gridinit conf |
| `openio_rdir_gridinit_file_prefix` | `""` | Maybe set it to {{ openio_memcached_namespace }}- for old gridinit's style |
| `openio_rdir_location` | `"{{ openio_location_room | default ('') }}{{ openio_location_rack | default ('') }}{{ openio_location_server | default (ansible_hostname ~ '.') }}{{ openio_rdir_serviceid }}"` | Location |
| `openio_rdir_namespace` | `"OPENIO"` | Namespace |
| `openio_rdir_provision_only` | `false` | Provision only without restarting services |
| `openio_rdir_serviceid` | `"0"` | ID in gridinit |
| `openio_rdir_slots` | `[rdir]` | The service's slot in conscience |
| `openio_rdir_threads` | `1` | Number of threads |
| `openio_rdir_volume` | `"/var/lib/oio/sds/{{ openio_rdir_namespace }}/{{ openio_rdir_servicename }}"` | Path to store data |
| `openio_rdir_worker` | `1` | Number of workers |

## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  become: true
  vars:
    NS: OPENIO
  roles:
    - role: users
    - role: repo
      openio_repository_no_log: false
      openio_repository_products:
        sds:
          release: "18.10"
    - role: namespace
      openio_namespace_name: "{{ NS }}"
    - role: gridinit
      openio_gridinit_namespace: "{{ NS }}"
      openio_gridinit_per_ns: true
    - role: rdir
      openio_rdir_namespace: "{{ NS }}"
```


```ini
[all]
node1 ansible_host=192.168.1.173
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

GNU AFFERO GENERAL PUBLIC LICENSE, Version 3

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
