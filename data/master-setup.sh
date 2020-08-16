sudo kubeadm init --pod-network-cidr=10.244.0.0/16 | grep "kubeadm join"  >> join-token
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

cp join-token /home/matt/Documents/multipass_kubernetes_full_install/v5/data/join-token
