#!/bin/bash

ipsec pki --gen > cakey.der
#CA certificate
ipsec pki --self --in cakey.der --dn "CN=VPN CA" --ca > cacert.der

#VPN private key
ipsec pki --gen > vpnkey.der
#VPN certificate
ipsec pki --pub --in vpnkey.der | ipsec pki --issue --cacert cacert.der --cakey cakey.der --dn "CN=<IP ADDRESS>" --san <IP ADDRESS> --flag serverAuth --flag ikeIntermediate  > vpncert.der

#Copy CA certificate to strongswan directory
mv cacert.der /etc/ipsec.d/cacerts/
#Copy VPN and VPNClient private keys to strongswan directory
mv vpnkey.der /etc/ipsec.d/private/
#Copy VPN and VPNClient certificates to strongswan directory
mv vpncert.der /etc/ipsec.d/certs/
