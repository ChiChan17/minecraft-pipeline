#!/bin/bash
set -e

echo "Creating Isolated Python Virtual Environment..."
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install pulumi pulumi-aws

echo "Launching Cloud Compute Framework via Pulumi..."
# Initialize a local dev environment if it doesn't exist
pulumi stack init dev --non-interactive || true
pulumi config set aws:region us-west-2

# Run the deployment 
pulumi up --yes --skip-preview

# Fetch the raw output IP from state cloud logs
INSTANCE_IP=$(pulumi stack output instance_ip)

echo "=========================================================================="
echo "Acme Corp Server Infrastructure has been successfully restored."
echo "Operational Endpoint IP: $INSTANCE_IP"

echo "for video demo nmap -sV -Pn -p T:25565 $INSTANCE_IP"
echo "=========================================================================="