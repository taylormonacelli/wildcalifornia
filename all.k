{




notes = r"""

how to specify path to ansible.cfg


https://docs.ansible.com/ansible/latest/reference_appendices/interpreter_discovery.html
https://stackoverflow.com/a/62482559/1495086
"""







    # each record should have a unique name.  here's a list of names you can use
    unique_ids = r"""
clumsy penguin
cunning coyote
timid rabbit
proud peacock
agile leopard
adventurous otter
charming koala
witty parrot
noble stag
resilient kangaroo
"""
    examples = [
        {
            override_interpeter_works = False
            disabled = True
            notes = r"""

this fails on ubuntu:focal container with local error:


+ ansible-playbook nginx.yml

[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [localhost] ***************************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [Install nginx] ***********************************************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: locale.Error: unsupported locale setting
fatal: [localhost]: FAILED! => {"changed": false, "module_stderr": "Traceback (most recent call last):\n  File \"/root/.ansible/tmp/ansible-tmp-1714696897.8728821-6402-217287530767175/AnsiballZ_apt.py\", line 107, in <module>\n    _ansiballz_main()\n  File \"/root/.ansible/tmp/ansible-tmp-1714696897.8728821-6402-217287530767175/AnsiballZ_apt.py\", line 99, in _ansiballz_main\n    invoke_module(zipped_mod, temp_path, ANSIBALLZ_PARAMS)\n  File \"/root/.ansible/tmp/ansible-tmp-1714696897.8728821-6402-217287530767175/AnsiballZ_apt.py\", line 47, in invoke_module\n    runpy.run_module(mod_name='ansible.modules.apt', init_globals=dict(_module_fqn='ansible.modules.apt', _modlib_path=modlib_path),\n  File \"<frozen runpy>\", line 226, in run_module\n  File \"<frozen runpy>\", line 98, in _run_module_code\n  File \"<frozen runpy>\", line 88, in _run_code\n  File \"/tmp/ansible_ansible.legacy.apt_payload_zkl_mwyz/ansible_ansible.legacy.apt_payload.zip/ansible/modules/apt.py\", line 1529, in <module>\n  File \"/tmp/ansible_ansible.legacy.apt_payload_zkl_mwyz/ansible_ansible.legacy.apt_payload.zip/ansible/modules/apt.py\", line 1237, in main\n  File \"/home/linuxbrew/.linuxbrew/opt/python@3.12/lib/python3.12/locale.py\", line 615, in setlocale\n    return _setlocale(category, locale)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^\nlocale.Error: unsupported locale setting\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

root@u:~/example-001#

"""
            name = "silly goose"
            txtar = r"""
-- jq.yml --
---
- hosts: localhost
  connection: local
  become: true

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version

    - name: Install jq
      ansible.builtin.package:
        name: jq
        state: present
-- run --
ansible-playbook -vvv jq.yml
"""
        }
        ########################################################################################################
        {
            override_interpeter_works = False
            disabled = True
            notes = r"""

Example of how to install many packages in one call to ansible.builtin.package


this fails on ubuntu:focal container with local error:


+ ansible-playbook nginx.yml

[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [localhost] ***************************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [Install nginx] ***********************************************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: locale.Error: unsupported locale setting
fatal: [localhost]: FAILED! => {"changed": false, "module_stderr": "Traceback (most recent call last):\n  File \"/root/.ansible/tmp/ansible-tmp-1714696897.8728821-6402-217287530767175/AnsiballZ_apt.py\", line 107, in <module>\n    _ansiballz_main()\n  File \"/root/.ansible/tmp/ansible-tmp-1714696897.8728821-6402-217287530767175/AnsiballZ_apt.py\", line 99, in _ansiballz_main\n    invoke_module(zipped_mod, temp_path, ANSIBALLZ_PARAMS)\n  File \"/root/.ansible/tmp/ansible-tmp-1714696897.8728821-6402-217287530767175/AnsiballZ_apt.py\", line 47, in invoke_module\n    runpy.run_module(mod_name='ansible.modules.apt', init_globals=dict(_module_fqn='ansible.modules.apt', _modlib_path=modlib_path),\n  File \"<frozen runpy>\", line 226, in run_module\n  File \"<frozen runpy>\", line 98, in _run_module_code\n  File \"<frozen runpy>\", line 88, in _run_code\n  File \"/tmp/ansible_ansible.legacy.apt_payload_zkl_mwyz/ansible_ansible.legacy.apt_payload.zip/ansible/modules/apt.py\", line 1529, in <module>\n  File \"/tmp/ansible_ansible.legacy.apt_payload_zkl_mwyz/ansible_ansible.legacy.apt_payload.zip/ansible/modules/apt.py\", line 1237, in main\n  File \"/home/linuxbrew/.linuxbrew/opt/python@3.12/lib/python3.12/locale.py\", line 615, in setlocale\n    return _setlocale(category, locale)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^\nlocale.Error: unsupported locale setting\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

root@u:~/example-001#

"""
            name = "playful kitten"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  connection: local
  become: true

  tasks:

   - name: Debug current environment
     debug:
       var: ansible_python_version


   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
       state: present
-- run --
ansible-playbook -vvv mypackages.yml
"""
            output = r"""
root@ip-172-31-31-195:~/wildcalifornia# ansible-playbook mypackages.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [localhost] *********************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
ok: [localhost]

TASK [Install jq and nginx] **********************************************************************************************************************************
ok: [localhost]

PLAY RECAP ***************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

root@ip-172-31-31-195:~/wildcalifornia#
"""
        }
        ########################################################################################################
        {
            name = "majestic lion"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  connection: local
  become: true

  vars:
    ansible_python_interpreter: /usr/bin/python3

  tasks:

   - name: Debug current environment
     debug:
       var: ansible_python_version

   - name: Install jq
     ansible.builtin.package:
       name:
         - jq
       state: present
-- run --
ansible-playbook -vvv mypackages.yml
"""
            output = r"""


root@ip-172-31-31-195:~/wildcalifornia# bash -ex run
+ ansible-playbook mypackages.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [localhost] *********************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
cat myok: [localhost]

TASK [Install jq and nginx] **********************************************************************************************************************************
p       ok: [localhost]

PLAY RECAP ***************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

root@ip-172-31-31-195:~/wildcalifornia# cat mypackages.yml
---
- hosts: localhost
  connection: local
  become: true

  vars:
    ansible_python_interpreter: /usr/bin/python3

  tasks:

   - name: Debug current environment
     debug:
       var: ansible_python_version




   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
       state: present
root@ip-172-31-31-195:~/wildcalifornia#

"""
        }
        ########################################################################################################
        {
            override_interpeter_works = False
            name = "curious monkey"
            txtar = r"""


-- inventory.yml --

---
all:
  hosts:
    localhost:
      ansible_connection: local




-- playbook.yml --


---
- hosts: all
  become: true

  tasks:

   - name: Debug current environment
     debug:
       var: ansible_python_version




   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
         - nginx
       state: present


-- run --
ansible-playbook -vvv -i inventory.yml playbook.yml

"""
            notes = r"""
This is the first to not give inventory warning, yay!

"""
            output = r"""

root@ip-172-31-31-195:~/wildcalifornia# bash -ex run
+ ansible-playbook -i inventory.yml playbook.yml

PLAY [all] ***************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
ok: [localhost]

TASK [Install jq and nginx] **********************************************************************************************************************************
ok: [localhost]

PLAY RECAP ***************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

root@ip-172-31-31-195:~/wildcalifornia#

"""
        }
        ########################################################################################################
        {
            disabled = True
            name = "graceful swan"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  connection: local
  become: true

  vars:
    ansible_python_interpreter: /home/linuxbrew/.linuxbrew/bin/python3.8

  tasks:

   - name: Debug current environment
     debug:
       var: ansible_python_version




   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
       state: present
-- run --
ansible-playbook -vvv mypackages.yml
"""
        }
        ########################################################################################################
        {
            disabled = True
            name = "mischievous squirrel"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  connection: local
  become: true

  vars:
    ansible_python_interpreter: /home/linuxbrew/.linuxbrew/bin/python3.8

  tasks:

   - name: Debug current environment
     debug:
       var: ansible_python_version




   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
       state: present
-- run --
LANG=C.UTF-8 ansible-playbook -vvv mypackages.yml
"""
        }
        ########################################################################################################
        {
            name = "loyal dog"
            txtar = r"""

-- mypackages.yml --
---


- hosts: localhost
  environment:
    LANG: en_US.UTF-8
    LC_ALL: en_US.UTF-8
  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version




    - name: Install jq
      apt:
        name:
          - jq
        state: present


-- run --
ansible-playbook -vvv mypackages.yml
"""
        }
        ########################################################################################################
        {
            override_interpeter_works = True
            disabled = True
            name = "wise owl"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  connection: local
  become: true

  vars:
    ansible_python_interpreter: /home/linuxbrew/.linuxbrew/bin/python3

  tasks:

   - name: Debug current environment
     debug:
       var: ansible_python_version




   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
       state: present
-- run --
ansible-playbook -vvv mypackages.yml
"""
        }
        ########################################################################################################
        {
            override_interpeter_works = True
            disabled = True
            name = "nimble gazelle"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  vars:

    # real path, not symlink
    ansible_python_interpreter: "/home/linuxbrew/.linuxbrew/Cellar/python@3.12/3.12.3/bin/python3.12"

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version




    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ansible-playbook -vvv mypackages.yml
"""
        }
        ########################################################################################################
        {
            override_interpeter_works = True
            disabled = True
            name = "mighty elephant"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  vars:

    # symlink
    ansible_python_interpreter: /home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version

    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ansible-playbook -vvv mypackages.yml
"""
        }
        ########################################################################################################
        {
            override_interpeter_works = True
            disabled = True
            name = "clever fox"
            txtar = r"""



-- mypackages.yml --
---
- hosts: localhost

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version

    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ansible-playbook -vvv mypackages.yml
"""
        }
        ########################################################################################################
        {
            notes = r"""

      """
            override_interpeter_works = False
            disabled = True
            name = "gentle giraffe"
            txtar = r"""
-- ansible.cfg --
[defaults]
ansible_python_interpreter=/home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python
interpreter_python=/home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python


-- mypackages.yml --
---
- hosts: localhost

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version


    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ANSIBLE_CONFIG=./ansible.cfg ansible-playbook -vvv mypackages.yml

"""
        }
        ########################################################################################################
        {
            notes = r"""

this works to ovverride python.  With this, we correctly use python 3.12

      """
            override_interpeter_works = True
            disabled = True
            name = "energetic puppy"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost

  vars:
    ansible_python_interpreter: /home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version


    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ANSIBLE_CONFIG=./ansible.cfg ansible-playbook -vvv mypackages.yml

"""
        }
        ########################################################################################################
        {
            override_interpeter_works = False
            disabled = True
            name = "sneaky raccoon"
            txtar = r"""
-- mypackages.yml --
---
- hosts: localhost

  vars:
    interpreter_python: /home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version


    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ANSIBLE_CONFIG=./ansible.cfg ansible-playbook -vvv mypackages.yml

"""
        }
        ########################################################################################################
        {
            override_interpeter_works = False
            disabled = True
            name = "brave wolf"
            txtar = r"""


-- ansible.cfg --
[defaults]
ansible_python_interpreter=/home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python
interpreter_python=/home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python


-- mypackages.yml --
---
- hosts: localhost

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version


    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
export ANSIBLE_CONFIG=./ansible.cfg
ansible-playbook -vvv mypackages.yml

"""
        }
        ########################################################################################################
        {
            override_interpeter_works = False
            disabled = True
            name = "friendly dolphin"
            txtar = r"""




-- mypackages.yml --
---
- hosts: localhost

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version


    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --

export ANSIBLE_PYTHON_INTERPRETER=/home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python
ansible-playbook -vvv mypackages.yml


"""
        }


        ########################################################################################################
        {
            notes = r"""



https://docs.ansible.com/ansible/latest/reference_appendices/config.html


The configuration file
Changes can be made and used in a configuration file which will be searched for in the following order:

ANSIBLE_CONFIG (environment variable if set)

ansible.cfg (in the current directory)

~/.ansible.cfg (in the home directory)

/etc/ansible/ansible.cfg

Ansible will process the above list and use the first file found, all others are ignored.

      """
            override_interpeter_works = False
            disabled = True
            name = "humble hedgehog"
            txtar = r"""
-- ansible.cfg --
[defaults]
ansible_python_interpreter=/home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python
interpreter_python=/home/linuxbrew/.linuxbrew/opt/python@3.12/libexec/bin/python


-- mypackages.yml --
---
- hosts: localhost

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version

    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ansible-playbook -vvv mypackages.yml

"""
        }



        ########################################################################################################
        {
            notes = r"""


using real path instead of symlink fails to override in this case


https://docs.ansible.com/ansible/latest/reference_appendices/config.html


The configuration file
Changes can be made and used in a configuration file which will be searched for in the following order:

ANSIBLE_CONFIG (environment variable if set)

ansible.cfg (in the current directory)

~/.ansible.cfg (in the home directory)

/etc/ansible/ansible.cfg

Ansible will process the above list and use the first file found, all others are ignored.

      """
            override_interpeter_works = False
            disabled = True
            name = "swift cheetah"
            txtar = r"""
-- ansible.cfg --
[defaults]
ansible_python_interpreter=/home/linuxbrew/.linuxbrew/Cellar/python@3.12/3.12.3/bin/python3.12
interpreter_python=/home/linuxbrew/.linuxbrew/Cellar/python@3.12/3.12.3/bin/python3.12


-- mypackages.yml --
---
- hosts: localhost

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version

    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ansible-playbook -vvv mypackages.yml

"""
        }

















        ########################################################################################################
        {
            notes = r"""




https://docs.ansible.com/ansible/latest/reference_appendices/config.html


The configuration file
Changes can be made and used in a configuration file which will be searched for in the following order:

ANSIBLE_CONFIG (environment variable if set)

ansible.cfg (in the current directory)

~/.ansible.cfg (in the home directory)

/etc/ansible/ansible.cfg

Ansible will process the above list and use the first file found, all others are ignored.

      """
            override_interpeter_works = False
            disabled = True
            name = "fierce tiger"
            txtar = r"""

-- ansible.cfg --
[defaults]
ansible_python_interpreter=/home/linuxbrew/.linuxbrew/Cellar/python@3.12/3.12.3/bin/python3.12
interpreter_python=/home/linuxbrew/.linuxbrew/Cellar/python@3.12/3.12.3/bin/python3.12



-- mypackages.yml --
---
- hosts: localhost
  connection: local
  become: true

  tasks:

    - name: Debug current environment
      debug:
        var: ansible_python_version

    - name: Install jq
      apt:
        name:
          - jq
        state: present

-- run --
ansible-playbook -vvv mypackages.yml

"""
        }








    ]
}
