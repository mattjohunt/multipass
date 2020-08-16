multipass launch --name master --cpus 2 --mem 4G --disk 40G
multipass mount ./data master
multipass exec master -- . /home/matt/Documents/multipass_kubernetes_full_install/v5/data/docker-k8-setup.sh

multipass launch --name node1 --mem 2G
multipass mount ./data node1
multipass exec node1 -- . /home/matt/Documents/multipass_kubernetes_full_install/v5/data/docker-k8-setup.sh

multipass launch --name node2 --mem 2G
multipass mount ./data node2
multipass exec node2 -- . /home/matt/Documents/multipass_kubernetes_full_install/v5/data/docker-k8-setup.sh

multipass exec master -- . /home/matt/Documents/multipass_kubernetes_full_install/v5/data/master-setup.sh

multipass exec node1 -- sh /home/matt/Documents/multipass_kubernetes_full_install/v5/data/join-token
multipass exec node2 -- sh /home/matt/Documents/multipass_kubernetes_full_install/v5/data/join-token

multipass exec master -- sh /home/matt/Documents/multipass_kubernetes_full_install/v5/data/flannel-setup.sh
multipass exec node1 -- sh /home/matt/Documents/multipass_kubernetes_full_install/v5/data/flannel-setup.sh
multipass exec node2 -- sh /home/matt/Documents/multipass_kubernetes_full_install/v5/data/flannel-setup.sh

multipass exec master -- sh /home/matt/Documents/multipass_kubernetes_full_install/v5/data/flannel-master-setup.sh
