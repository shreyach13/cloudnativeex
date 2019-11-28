# Ansible

- More information on Ansible can be found at https://docs.ansible.com/ansible/latest/index.html

- To see a all available Ansible modules: https://docs.ansible.com/ansible/latest/modules/list_of_all_modules.html

## Exercises

- Create an `ansible.cfg` file containing the following:
  ```
  $ cat ansible.cfg
  [defaults]
  roles_path = roles
  inventory = ./inventory
  ```

- Create your inventory file. The group that the host needs to be part of is `ci`.

- Create an EC2 instance of size `t2.micro`. The public IP of this host can be found in the AWS console.

- Select and copy the public IP address and paste it in the `ansible_host` variable, for example:
  ```sh
  $ cat inventory
  ```
  ```
  [ci]
  jenkins ansible_host=3.82.165.1 ansible_user=ec2-user
  ```

- Test communication between you and the jenkins instance:
  ```
  $ ansible all -m ping
  jenkins | SUCCESS => {
      "changed": false,
      "ping": "pong"
  }
  ```

- Create the Jenkins role:
  ```
  $ ansible-galaxy init roles/jenkins
  
  - roles/jenkins was created successfully
  ```

- Create the top level jenkins.yml file that will install the Jenkins role:
  ```
  - hosts: all
    roles:
      - jenkins
  ```

- Run the top level playbook (and watch it do nothing):
  ```
  $ ansible-playbook jenkins.yml -b (to run in sudo mode)
  ```
  ```
  Output:
  
  PLAY [all] ********************************************************************

  TASK [Gathering Facts] ********************************************************
  ok: [localhost]

  PLAY RECAP ********************************************************************
  localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  ```

- With reference to the documentation, implement each of the following actions using the relevant Ansible modules and parameters:

- Install java package `default-jre` using the package ansible module in `roles/jenkins/tasks/main.yml`

- Download the Jenkins `war` file to `/usr/local/etc` using the `get_url` module.

- Add and deploy the jenkins service file to `/etc/systemd/system/jenkins.service` using the `template` module. Make sure to replace the file paths as required.
  ```
  [Unit]
  Description=Jenkins Daemon

  [Service]
  ExecStart=/usr/bin/java -jar /home/jenkins_user/jenkins.war

  [Install]
  WantedBy=multi-user.target
  ```

- Add handler in `roles/jenkins/handlers/main.yml` to restart the jenkins system service. Use the `systemd` module.
  ```
  ---
  # handlers file for roles/jenkins
  - name: restart jenkins service
    systemd:
      name: jenkins
      state: restarted
  ```

- Modify the required tasks to restart Jenkins service if it is required using the `notify` module. You will need to ask yourself the following question to make sure the restart happens every time it is required:

  - When would you need to restart jenkins?

    If you update the binary?

    If you update the config?

  Create a dummy change (add a new line) in the config file and apply the change with `ansible-playbook jenkins.yml`. Did you see the service restarting ?

- Flush handlers by using the `meta` module (and more specifically the `flush_handlers` option). This is a special command that will force running the handlers to ensure that the service is started before we wait for the password file.

- Wait for the password file to show up in the remote server using the `wait_for` module.

- Display the Administrator password on screen with a combination of `shell` module with `register` and `debug`.

- Add tests for Jenkins to verify it is up and running.

  You will need to ask yourself what is defined as 'done' for a jenkins server to be up and running.

  - A few ideas are:

    Jenkins is listening to the required port, using the `wait_for` module.

    Jenkins url responds with an expected response using the `uri` module.
