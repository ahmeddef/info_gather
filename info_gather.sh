#!/bin/bash

# Check if a domain was provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1

echo "Gathering information for: $DOMAIN"

# Perform DNS lookup
echo -e "\n[+] DNS Lookup"
dig +short $DOMAIN

# Get WHOIS information
echo -e "\n[+] WHOIS Information"
whois $DOMAIN

# Perform a reverse DNS lookup
echo -e "\n[+] Reverse DNS Lookup"
host $DOMAIN

# Gather subdomains using sublist3r (make sure it's installed)
echo -e "\n[+] Subdomain Enumeration"
sublist3r -d $DOMAIN

# Check for open ports using nmap
echo -e "\n[+] Open Ports"
nmap -Pn -p- $DOMAIN

# Perform an HTTP header check
echo -e "\n[+] HTTP Header Check"
curl -I $DOMAIN

echo -e "\n[+] Information gathering completed."
