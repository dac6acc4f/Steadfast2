ClientPublicKey="$1"
ServerPrivateKey="$2"

echo '-----BEGIN PUBLIC KEY-----' > keyGen/client-pub.pem
echo $ClientPublicKey | cut -c1-64 >> keyGen/client-pub.pem 
echo $ClientPublicKey | cut -c65-128 >> keyGen/client-pub.pem 
echo $ClientPublicKey | cut -c129-196 >> keyGen/client-pub.pem 
echo '-----END PUBLIC KEY-----' >> keyGen/client-pub.pem

echo '-----BEGIN EC PRIVATE KEY-----' > keyGen/server.pem
echo $ServerPrivateKey >> keyGen/server.pem
echo '-----END EC PRIVATE KEY-----' >> keyGen/server.pem

openssl pkeyutl -derive -inkey "keyGen/server.pem" -peerkey "keyGen/client-pub.pem"
