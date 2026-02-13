# --- GLOBALES ---
proxmox_host     = "proxmox"
template_name    = "local:vztmpl/alpine-3.23-default_20260116_amd64.tar.xz"
global_gateway   = "192.168.1.1"
ssh_key_public   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDcx8JJwA+eHO3Dyia/rg2uLP9GpVqRyoanG9n/IDAUek8aOBBczRxNKdHvO997cHbg0xEsNfkPWRb+35Ka3cMgq4miyZ1as+XOuRJNH40mD/moW+2feUZe2q+81xBBNMie93ZvMqzG/FCaKogUv5kSY91tqrLffni9Zc09XgjtUA7o1ECeCmARa0gIkOl3aTxQjtS15/pSvn9PyZk5zBs/VrKx3bA/rgSJmfPZYQy6bDH7EtJhMrjnOF2VIBvWgmKvmT7JKehK66zHYu1i9U/LTvrOGoJVBKIWT049JtMpjHeqccGZssInnRXua7CWCTn5QZO3aVz4tkH8h3kX4k8WiQ+kRAyN6Nk4BqGIUFF6DSE6ZHjEL2KR4GrVbN9uM34c72idD/SQE0FdkrPqzz1yqdzE6HrhG0ocKJoLJ2C7KLctjIHiNhwpq8c8sMZWI8JZE2NZFaO57hrwZyd6TLWJXxlKV9DzOBe0suankZntvu8+7b3KQUkK1vw4KTxAjXYAAP5BJuiGu+zxARK2D9b73D4YWoCLeoJOYgGeCkOxu+lhevEU69CLtVA+nCyRcGKd2L6hU5ej9ryZJAkQVuACajCvE3zmzBgsD2aZ6aRRXVKFU7hRl4NaAE+QRkxw/j2rNCUhfTXY7lBEWetcOQkoMykvRoDnL7LaaxZJfTN9EQ== eddygalamba@hotmail.com"
pm_api_url  = "https://192.168.1.99:8006/api2/json"
pm_user     = "root@pam" 
pm_password = "Eddygalamba1!"
# --- DATOS DEL LXC BÁSICO ---
basic_id   = "900"
basic_ip   = "192.168.1.50/24"

# --- DATOS DEL LXC AVANZADO (DOCKER) ---
adv_id     = "901"
adv_ip     = "192.168.1.51/24"
adv_cores  =  2
adv_ram    = "2048"
adv_bridge = "vmbr1001"
# Definimos el Bind Mount de forma individual
adv_mount_key     = "0"
adv_mount_slot    = 0
adv_mount_storage = "/raid1/storage/infra_data/labs/nginx"  # Host
adv_mount_mp      = "/var/www/html/"                        # Container
adv_mount_size    = "0G"                                    # 0G = Bind Mount
