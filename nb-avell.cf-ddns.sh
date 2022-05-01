#!/bin/bash

[ ! -f .env ] || export $(grep -v '^#' .env | xargs)

export token="$CF_TOKEN"
export domain="$CF_DOMAIN"
export record="$CF_RECORD"
export email="$CF_EMAIL"

echo token=$token
echo domain=$domain
echo record=$record
echo email=$email

# ref: https://api.cloudflare.com/
# ref: https://adamtheautomator.com/cloudflare-dynamic-dns/

curl -X GET "https://api.cloudflare.com/client/v4/user/tokens/verify" \
     -H "Authorization: Bearer $token" \
     -H "Content-Type:application/json"

# ref: https://stackoverflow.com/questions/35365769/how-do-i-use-jq-to-convert-number-to-string

zone_id=$(
  curl -X GET "https://api.cloudflare.com/client/v4/zones?name=$domain" \
       -H "Authorization: Bearer $token" \
       -H "Content-Type:application/json" \
      | jq -r .result[0].id
  )

# ref: https://stackoverflow.com/questions/1955505/parsing-json-with-unix-tools
# ref: https://unix.stackexchange.com/questions/413878/json-array-to-bash-variables-using-jq
# ref: https://support.zendesk.com/hc/en-us/articles/4408819734426-API-error-curl-3-URL-using-bad-illegal-format-or-missing-URL#:~:text=Resolution,double%20quotes%20around%20your%20URL.
# ref: https://stackoverflow.com/questions/17185075/how-to-use-read-command-read-a-whole-line-data-which-end-with-crlf-under-b

typeset -A dns_record
while IFS== read -r key value; do
    dns_record["$key"]="$value"
done < <(
  curl -X GET "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records?name=$record" \
       -H "Authorization: Bearer $token" \
       -H "Content-Type:application/json" \
      | jq -r '.result[0] | to_entries | .[] | .key + "=" + (.value|tostring)' \
      | tr -d "\r"
  )

old_ip=${dns_record[content]}
record_type=${dns_record[type]}
record_id=${dns_record[id]}
record_ttl=${dns_record[ttl]}
record_proxied=${dns_record[proxied]}

# ref: https://api.ident.me/

new_ip=$(curl v6.ident.me)

if [ "$new_ip" != "$old_ip" ]; then

  # ref: https://reqbin.com/req/curl/c-dwjszac0/curl-post-json-example
  curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/${dns_record[id]}" \
       -H "X-Auth-Email: $email" \
       -H "Authorization: Bearer $token" \
       -H "Content-Type:application/json" \
       -d '{
       "type": "'$record_type'",
       "name": "'$record'",
       "content": "'$new_ip'",
       "ttl": "'$record_ttl'",
       "proxied": '$record_proxied'
       }'

fi
