Dcycle Kube helper
=====

Accompanies the blog post [Deploying Drupal to Kubernetes, no previous knowledge required
April 22, 2020 (updated Oct. 31, 2022), Dcycle Blog](https://blog.dcycle.com/kubernetes/).

Helper scripts
-----

The ./scripts folder contains a number of scripts useful to set up a Kubernetes cluster.

Helm encrpyt helper
-----

Helps with setting up an Nginx proxy ingress and letsencrypt certificates on Kubernetes.

Sets up LetsEncrypt for a Kubernetes cluster via Helm, assuming you already have an Nginx reverse proxy and [cert-manager](https://hub.kubeapps.com/charts/stable/cert-manager).

To create this
-----

* Make sure you have a domain name or several domain names which resolve to your Nginx proxy's public IP address, let's say one.example.com and two.example.com
* Make sure you have running services on your Kubernetes cluster, say, "my-drupal-site" and "my-wordpress-site".
* Copy everything from ./unversioned-examples to ./unversioned and fill in the details.

Note that there is a file ./unversioned/other which should contain:

    STAGING=true

This is because we want to test everything without running into the Kubernetes production rate limits before we go on.

Then, run the following command:

    ./scripts/apply.sh

This will set up your ingress and your Letsencrypt certificates.

This takes a while; you can follow progress by running:

You will be able to load your domains (say, one.example.com) in a browser but **the certificate will not be valid** because it will be "Fake LE root X1" (staging) type certificate.

This is good thing, it means your logic works!

Once you can access your site(s) with an invalid HTTPS "Fake LE root X1" certificate, remove the /unversioned/other file altogether, or remove the line "STAGING=true" from it, and rerun:

    ./scripts/apply.sh

Wait a few minutes, and you should now be able to access your site securely.

To delete the ingress and certificates (the chart), type:

    ./scripts/delete.sh

Uninstalling
-----

    rm -rf $HOME/.digitalocean
    rm -rf $HOME/.kube/kubernetes-helper-*

Resources
-----

* [How To Create Your First Helm Chart, Bitnami documentation](https://docs.bitnami.com/kubernetes/how-to/create-your-first-helm-chart/)
