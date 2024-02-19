# WordPress with Kubernetes and Terraform on AWS

Proof of concept on how to deploy WordPress with Kubernetes and Terraform on AWS.

The explanation on how to use this deployment can be found at my [blog](https://ntorga.com/deploying-wordpress-with-kubernetes-and-terraform-on-aws/). This is not intended for a production environment.

## Contacts

For any question or feedback feel free to contact me:

- Email: northontorga _(plus)_ github _(at)_ gmail.com
- Twitter: [@NorthonTorga](https://twitter.com/northontorga)
- Linkedin: [Northon Torga](https://www.linkedin.com/in/ntorga/)

## カスタマイズ

fork 元から 2024/02/19 に使っても違和感がないように修正をしました。

https://github.com/ntorga/terraform-k8s-aws-wp-poc/commit/052668d672c01a9b4b14dab2613a26eb3b4f631e

052668d672c01a9b4b14dab2613a26eb3b4f631e

コードについてのチケットや修正は GitHub.com までお願いします。

その他の質問やフィードバックがあれば以下の連絡先までお願いします。

For any question or feedback feel free to contact me:

- Email: takano32 _(plus)_ github _(at)_ gmail.com
- X(Twitter): [@takano32](https://x.com/takano32)
- Linkedin: [TAKANO Mitsuhiro](https://www.linkedin.com/in/takano32)


### よく使うコマンド

#### kubectl の設定

```
$ aws eks update-kubeconfig --name kube-wp
```

#### IP アドレスの表示

```
$ kubectl get svc
```

#### コンテナに接続

```
$ kubectl exec --stdin --tty $(kubectl get pods | awk '/kube-wp/{print $1}' | tail -n1) -- /bin/bash
```

#### `wp-content` に必要なディレクトリの作成

```
$ kubectl exec $(kubectl get pods | awk '/kube-wp/{print $1}' | tail -n1) -- /bin/bash -c 'mkdir -p /opt/bitnami/wordpress/wp-content/{plugins,themes,uploads}'
```