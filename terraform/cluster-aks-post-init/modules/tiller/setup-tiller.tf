resource "kubernetes_service_account" "tiller" {
  metadata {
    name = "tiller"
    namespace = "kube-system"
  }
  
  automount_service_account_token = true
}

resource "kubernetes_cluster_role_binding" "tiller" {
    metadata {
      name = "tiller"
    }
    role_ref {
      api_group = "rbac.authorization.k8s.io"
      kind = "ClusterRole"
      name = "cluster-admin"
    }
    subject {      
      kind = "ServiceAccount"
      name = "tiller"
      namespace = "kube-system"
    }
}
