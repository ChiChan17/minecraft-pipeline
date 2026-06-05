#  Minecraft Server Deployment Pipeline
## CS 332: Systems Administration and Automation Capstone

 
## Background

The primary goal of this pipeline is to automate the manual tasks associated with cloud resource and application lifecycle management. It creates a secure, highly scalable virtual computing environment on the cloud for a production Minecraft server framework.
 
The system relies on a two-phase architecture:
* **(Pulumi & Python):** Instead of manually clicking buttons inside the AWS Web Management Console, the underlying infrastructure is written programmatically using Python. When executed, Pulumi interacts with the cloud provider APIs to guarantee state management, build a Virtual Private Cloud network mapping, define security groups, and boot a dedicated Ubuntu EC2 compute node.

* ** (Ansible):** Once the infrastructure is alive and reporting an operational IPv4 address, execution drops to Ansible. Ansible establishes a SSH connection to the remote compute node. Without human intervention, it installs the headless Java Virtual Machine execution runtime environment, builds isolated system file directories, sets up the configurations, and network endpoints, and kicks off execution.

---

## Pipeline Architecture

The operational workflow flows from the local development subsystem straight to the live production environment. The major steps of this pipeline can be understood through the following layout:



1. **Local Initialization:** Runtime credential variables are injected into the active WSL shell profile layer.
2. **IaC State Evaluation:** The Pulumi engine calculates the delta between the requested architecture state and real-world infrastructure, then builds the security matrix alongside the target EC2 node.
3. **Endpoint Extraction:** The allocated public IPv4 address string is extracted and written directly into the automated pipeline inventory manifest.
4. **Target Provisioning:** Ansible initiates an SSH connection, processing to verify package trees, provision runtimes, and spin up background daemons.
5. **Boundary Verification:** Network analysis engines verify target port exposures on the live remote endpoint interface.

---

## 3. Local Environment & System Requirements

To execute this deployment pipeline successfully, the local control environment must be pre configured with specific system dependencies, tools, and command-line interfaces (CLIs).

### Required Software Tools & Engine Installs
Your local machine (for Ubuntu Linux or Windows Subsystem for Linux aka WSL) requires the following installations:
* **Python 3.10 or Higher:** Required to run the underlying Pulumi program stack and manage virtual scripts.
* **Pulumi CLI:** The core engine interface used to synthesize local code declarations into remote infrastructure. [Pulumi Installation Instructions](https://www.pulumi.com/docs/install/)
* **Ansible Core (2.12+):** The engine tracking agent used to remotely provision system environments. [Ansible Installation Reference](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* **Nmap Networking Utility:** Used for pipeline post validation to safely scan remote interface sockets.

### Required AWS Platform Credentials & Tokens
Because deployment targets AWS Academy Learner Lab environments. You must source seasonal token exports directly from your active classroom terminal window:

1. Open your active **AWS Academy Learning Portal**.
2. Click into your **Learner Lab** control dashboard.
3. Click on the **AWS Details** button to display environment credentials.
4. Export or save the temporary terminal session string blocks (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_SESSION_TOKEN`).

---

## 4. Step-by-Step Deployment Execution Tutorial

Follow these commands sequentially from within your root pipeline code repository folder.

### Step 1: Initialize Local Terminal Environment Variables
Before running the deployment, you must declare and assign your active AWS credentials to the current terminal memory block so that local management can securely authenticate with your remote cloud infrastructure.

```bash
export PULUMI_CONFIG_PASSPHRASE=""

export AWS_ACCESS_KEY_ID="YOUR_ACTIVE_LAB_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_ACTIVE_LAB_SECRET_ACCESS_KEY"
export AWS_SESSION_TOKEN="YOUR_ACTIVE_LAB_SESSION_TOKEN"