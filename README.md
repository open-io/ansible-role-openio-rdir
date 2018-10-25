[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-rdir.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-rdir)
# Ansible role `rdir`

An Ansible role for OpenIO rdir. Specifically, the responsibilities of this role are to:

- install and configure rdir

## Requirements

- Ansible 2.4+

## Role Variables


| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_rdir_bind_address` | `` | ... |
| `openio_rdir_bind_interface` | `"ansible_default_ipv4.alias"` | ... |
| `openio_rdir_bind_port` | `6300` | ... |
| `openio_rdir_gridinit_dir` | `"/etc/gridinit.d/{{ openio_rdir_namespace }}"` | ... |
| `openio_rdir_gridinit_file_prefix` | `""` | ... |
| `openio_rdir_location` | `"{{ ansible_hostname }}.{{ openio_rdir_serviceid }}"` | ... |
| `openio_rdir_namespace` | `"OPENIO"` | ... |
| `openio_rdir_provision_only` | `false` | ... |
| `openio_rdir_serviceid` | `"0"` | ... |
| `openio_rdir_threads` | `1` | ... |
| `openio_rdir_volume` | `"/var/lib/oio/sds/{{ openio_rdir_namespace }}/rdir-{{ openio_rdir_serviceid }}"` | ... |
| `openio_rdir_worker` | `1` | ... |

## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  become: true
  vars:
    NS: OPENIO
  roles:
    - role: repo
      openio_repository_products:
        sds:
          release: "18.04"
    - role: namespace
      openio_namespace_name: "{{ NS }}"
    - role: gridinit
      openio_gridinit_namespace: "{{ NS }}"
    - role: role_under_test
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
