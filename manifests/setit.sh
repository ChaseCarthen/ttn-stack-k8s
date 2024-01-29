POD=ttn-lw-stack-6788677489-kxw9s
kubectl exec -ti -n thingstack $POD -- stack is-db create-admin-user --id admin --email chase@nevada.unr.edu
kubectl exec -ti -n thingstack $POD -- stack is-db create-oauth-client \
 --id cli \
 --name "Command Line Interface" \
 --owner admin \
 --no-secret \
 --redirect-uri "local-callback" \
 --redirect-uri "code"


CONSOLE_SECRET="console"
SERVER_ADDRESS="https://134.197.75.58:30126"
kubectl exec -ti -n thingstack $POD -- stack is-db create-oauth-client \
  --id console \
  --name "console" \
  --owner admin \
  --secret "${CONSOLE_SECRET}" \
  --redirect-uri "${SERVER_ADDRESS}/console/oauth/callback" \
  --redirect-uri "/console/oauth/callback" \
  --logout-redirect-uri "${SERVER_ADDRESS}/console" \
  --logout-redirect-uri "/console"