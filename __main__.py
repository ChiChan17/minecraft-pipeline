import pulumi
import pulumi_aws as aws

#Create the Security Group
minecraft_sg = aws.ec2.SecurityGroup(
    "acme-minecraft-security-pulumi",
    description="Managed by Pulumi for Acme Corp Minecraft Infrastructure",
    ingress=[
        aws.ec2.SecurityGroupIngressArgs(
            from_port=22,
            to_port=22,
            protocol="tcp",
            cidr_blocks=["0.0.0.0/0"],
            description="SSH Access",
        ),
        aws.ec2.SecurityGroupIngressArgs(
            from_port=25565,
            to_port=25565,
            protocol="tcp",
            cidr_blocks=["0.0.0.0/0"],
            description="Minecraft Game Port",
        ),
    ],
    egress=[
        aws.ec2.SecurityGroupEgressArgs(
            from_port=0,
            to_port=0,
            protocol="-1",
            cidr_blocks=["0.0.0.0/0"],
        )
    ],
)

#Create the EC2 Instance  no broken key_name attribute
minecraft_node = aws.ec2.Instance(
    "minecraft_node_pulumi",
    instance_type="t3.medium",
    ami="ami-0735c191cf914754d", 
    vpc_security_group_ids=[minecraft_sg.id],
    key_name="labsuser",
    tags={
        "Name": "Acme-Corp-Minecraft-Server",
    },
)

#export the Public IP 
pulumi.export("instance_ip", minecraft_node.public_ip)