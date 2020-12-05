clean_bq:
	for table in `bq ls --max_results=10000  --project_id $(gcp_project_id) | grep $(gcp_dataset)` ; do \
	  bq rm -r -f $$table;\
	 done

update_profile:
	cp .dbt/profiles.yml $$HOME/.dbt/profiles.yml


gcp_auth:
	gcloud auth application-default login \
  	--scopes=https://www.googleapis.com/auth/userinfo.email,\
	https://www.googleapis.com/auth/cloud-platform,\
	https://www.googleapis.com/auth/drive.readonly


init_dbt:
	dbt init $(project_name) --adapter bigquery


