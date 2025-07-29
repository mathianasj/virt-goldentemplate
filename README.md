# Helm Chart Golden Template for Virt POCs

## Steps

1. Navigate to the VMware VDDK version 8 download page https://developer.vmware.com/web/sdk/8.0/vddk
1. Select version 8.0.1 and click Download.
1. Place the tar file in this folder
1. `oc patch configs.imageregistry.operator.openshift.io cluster --type merge -p '{"spec":{"rolloutStrategy":"Recreate","managementState":"Managed", "storage":{"pvc":{"claim":"image-registry"}}}}'`
1. `helm install operators ./apps/operators --values ./values.yaml`
1. `helm install app .`