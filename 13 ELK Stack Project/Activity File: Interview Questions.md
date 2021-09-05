                                        Domain: Network Security
                                            Faulty Firewall

If I was working for an organisation that had a firewall that was supposed to block SSH connections and was still letting them through, then that would be a serious issue that could have potentially catastrophic ramifications to the organisations network infrastructure and sensitive information, not to mention the impact a breach would have on the organisations stakeholders.

The first issue to rectify this issue would be to investigate the configuration of the access policies to see if there has been an oversight when setting up the policies. As part of my training we were tasked with setting up a network consisting of multiple virtual machines such as a JumpBox, multiple WebServers as well as the setup and configuration of an ELK server. This was conducted through Microsoft Azure.

When I setup the JumpBox, I set up a rule in the Network Security Group (NSG) to allow SSH access. The key here was that I ensured I specified in the rule that only my personal IP address was given permission to gain access to the JumpBox. Once I was able to SSH into the JumpBox, another rule was created to allow SSH access from the JumpBox into the Virtual Network using the private IP address of the JumpBox. The VM’s that would accept these connections were the WebServers and the ELK Server.

As the ELK Server was part of a different Virtual Network I created separate rules in a different NSG for the ELK Server. From the JumpBox I was successful in gaining SSH access. During this project I decided to look at the NSG for the ELK Server and noticed that SSH access was open to all IP addresses. I addressed this by changing the rules to only accept access from a specific IP address, I also documented this change. 

When I went back to log into the Server from the JumpBox, the terminal I was using hung at this command. This meant there was no access to the Server. I quickly realised that this was due to the most recent change made to the rules. This prompted me to reassess the rules to ensure they were strict enough to block unauthorized SSH access and open to specific SSH access.

Upon making these changes I logged back into the JumpBox and was able to gain access to the ELK server as required. Other issues that could arise is if the initial configuration of the JumpBox was made using a password instead of an SSH key. Using a password can be problematic as this leaves access for malicious actors to gain unauthorised access. A private SSH key is the recommended method to configure SSH access from an external workstation into a JumpBox. 

The overwhelming advantage to this solution is that I was successful in configuring the network with the necessary rules to strengthen security to the network. In regards to disadvantages, the only issue that could arise is if my personal credentials were weak or if the machine was accessed by an unauthorised user if the machine was unlocked then they could potentially gain access to the network. This is why security starts from the workstation, and ensuring the machine is secure will benefit the overall security of the network.