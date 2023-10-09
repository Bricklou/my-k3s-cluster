# Networking and security

## Networking

### Expose services

For my personal use, I only needs to expose these services from anywhere on the Internet:
- http/https
- ssh
- vpn

But ! To keep some security, the SSH access will be restricted to the local network only and the access will be through the VPN.
This way, I only need to expose the minimum required: http/https and vpn ports.

### Internal network

To manage my cluster internal network, I will work with [Kube-VIP](https://kube-vip.io/), a load balancer for Kubernetes clusters.
It will help me to manage the internal network and the load balancing between the nodes.

### VPN

To configure my VPN, I will obviously use OpenVPN, but, I recently discovered ovpn-admin, a web interface to manage OpenVPN.
It seems to be a very nice tool, so I will use it to manage all my configurations.
*More details available here: https://linuxiac.com/openvpn-ui-ovpn-admin*

## Security

Since the VPN help a lot as a layer of security, it isn't enough, this is why a firewall is required.
I will use UFW, a simple firewall to configure and manage. It is a wrapper for iptables which it is very powerful and
easy to use at the same time.
