kubectl create configmap postgres --from-file=pg_hba.conf  -n thingstack --dry-run --dry-run=client -o=yaml | tee > outcm.yaml 