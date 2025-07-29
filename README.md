# Helm Chart Golden Template for Virt POCs

## Steps

1. Navigate to the VMware VDDK version 8 download page https://developer.vmware.com/web/sdk/8.0/vddk
1. Select version 8.0.1 and click Download.
1. Place the tar file in this folder
1. `oc patch configs.imageregistry.operator.openshift.io cluster --type merge -p '{"spec":{"rolloutStrategy":"Recreate","managementState":"Managed", "storage":{"pvc":{"claim":"image-registry"}}}}'`
1. `helm install operators ./apps/operators --values ./values.yaml`
1. `helm install app .`
1. `oc cp ./VMware-vix-disklib-8.0.1-21562716.x86_64.tar.gz openshift-mtv/$(oc get pod -l deployment=vddk-utils -o=jsonpath='{.items[*].metadata.name}'):/var/www/html/VMware-vix-disklib-8.0.1-21562716.x86_64.tar.gz`
1. `oc start-build vddk-build -n openshift-mtv`