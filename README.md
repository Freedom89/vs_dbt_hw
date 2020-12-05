# Guide

This is the git repo for [this post](https://www.dataraccoon.com/knowledge/dbt_gcp). 

# Additional info

This docker image is build on top of [vscode remote container development.](https://code.visualstudio.com/docs/remote/containers) 

The default dbt database is bigquery. 

# Launch in vscode

* Install the recommended extensions
* Open command palette
* Select `remote-containers reubild and reopen in container` option. 
	* Select from `Dockerfile` 

# Pre-Req

* Understanding of docker
* Understanding of [dbt](https://docs.getdbt.com/) 

## foam

This links are populated with [foam](https://foambubble.github.io/foam/).

## dbt

Look at [[dbt/README]] on how to use dbt. 

## Using python

For your scripts: [[src/README]] 
For your notebooks: [[notebooks/README]] 

# Env Vars

Edit the env vars you need in your docker image. 

* Create an `env` folder with file named `env_file`. 

```
gcp_project_id=<<input your gcp project>>
gcp_dataset=<<input dataset>>
PYTHONPATH=workspaces/vs_dbt_hw
```

# Set up locally

First, install your packages by `pip install -r requirements.txt` (you might want to create a new venv). 

Next, configure your os.environ variables `gcp_project_id`, `gcp_dataset`. If you intend to also use the python src folder, define the `PYTHONPATH` to be the folder name.

Fore example, if you are running this in terminal, 

```
export gcp_project=<<id>>
export gcp_dataset=<<dataset>>
export PYTHONPATH=$(pwd)
```

Last, move the `.dbt/profiles.yml` to your `$HOME` directory. If you installed `make`, you can run `make update_profile`. Note, this will replace your existing profile if you have one! 

Cd into `dbt_hw` directory, 

* run `dbt deps` to install the packages for dbt
* you should now be able to run `dbt run`.