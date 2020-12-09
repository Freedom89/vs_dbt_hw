clean_bq:
	for table in `bq ls --max_results=10000  --project_id $(GCP_PROJECT_ID) | grep $(GCP_DATASET)` ; do \
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


DBT_PATH=dbt_hw/target/compiled/my_new_project/
TYPE=models #analysis #tests
dry_run:
	bq query --use_legacy_sql=false --dry_run --flagfile=$$(find $(DBT_PATH)$(TYPE) -name $(FILE))
