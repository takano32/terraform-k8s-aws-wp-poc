#
## WordPress Ingress
#
resource "kubernetes_ingress_v1" "kube-wp" {

  metadata {
    name = "kube-wp"
    annotations = {
      "kubernetes.io/ingress.class"                    = "nginx"
      "nginx.ingress.kubernetes.io/backend-protocol"   = "HTTP"
      "nginx.ingress.kubernetes.io/ssl-redirect"       = "false"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "false"
      "nginx.ingress.kubernetes.io/proxy-body-size"    = "2048m"
      "nginx.ingress.kubernetes.io/affinity"           = "cookie"
    }
  }

  spec {
    rule {
      host = "blog.${var.stage-domain}"

      http {
        path {
          path = "/"
          backend {
            service {
              name = "kube-wp"
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}
