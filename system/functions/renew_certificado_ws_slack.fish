function renew_certificado_ws_slack --description "Renova o certicado o websocket do slack"
    echo | openssl s_client -servername wss-primary.slack.com -connect wss-primary.slack.com:443|sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/wss-primary.slack.com.cer
    keytool -delete -alias wss-primary.slack.com -keystore ~/.asdf/installs/java/adoptopenjdk-8.0.392+8/jre/lib/security/cacerts -storepass changeit
    keytool -import -alias wss-primary.slack.com -keystore ~/.asdf/installs/java/adoptopenjdk-8.0.392+8/jre/lib/security/cacerts -file /tmp/wss-primary.slack.com.cer -storepass changeit -noprompt
end
