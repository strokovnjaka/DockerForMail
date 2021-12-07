# Use case DockerEmail: a docker image that sends email everyday

Setup docker image for sending an email to recipients email everyday at set time, on Azure with terraform/ansible.

## Build the image

From [dailymail/mailto.py.tmpl](./dailymail/mailto.py.tmpl) create `dailymail/mailto.py` (set the mailing account data as well as the recipients, mail contents, ...).

You can also prepare the credentials (see below) before building the image, so they are ready when running. Note that in this case you should treat the image as private.

```bash
docker build --file Dockerfile --tag=strokovnjaka/uc3docker4mail .
```


## Test the image

### Run container

Prepare `credentials/azure.env` (e.g. from the template file `credentials/azure.env.tmpl`). Note that in this case you should treat the container as private.

Run the container:

```bash
docker run -d --privileged --rm --env-file "credentials/azure.env" --name uc3docker4mail strokovnjaka/uc3docker4mail
```

### Step into container

```bash
docker exec -it uc3docker4mail /bin/bash
```


### Run terraform in container

As terraform is initialized via `.bashrc`, just apply the plan:

```bash
terraform apply
```

This creates the Azure Container Registry, then the docker image (that will send the daily mail) to be pushed to ACR. Next, an Azure Logic App is created that schedules running the container daily at defined time.

Outputs are `login_server` (of the created ARC), `admin_username` (admin user for the ACR), and `admin_password` (admin password for the ACR).


## Push the image to Docker Hub

In case you want to push the image to the hub:

```bash
docker push strokovnjaka/uc3docker4mail
```