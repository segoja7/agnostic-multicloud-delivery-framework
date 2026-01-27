# amdf generate-k8s

Generate KCL schema and blueprint from native Kubernetes objects.

```bash
amdf generate-k8s KIND [OPTIONS]
```

!!! note "Kind Names"
    Kind names are case-sensitive and must match exactly (e.g., `Service` not `service`). Use `amdf list-k8s` to see available kinds.

**Options:**

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--version` | `-v` | TEXT | `1.35.0` | Kubernetes version |
| `--output` | `-o` | TEXT | `.` | Output directory |
| `--blueprint/--no-blueprint` | | BOOL | `True` | Generate blueprint |
| `--policy-template/--no-policy-template` | | BOOL | `True` | Generate policy template |

**Examples:**

```bash
# Generate Pod schema (latest K8s version)
amdf generate-k8s Pod

# Generate Service schema for specific K8s version
amdf generate-k8s Service --version 1.30.0

# Generate without blueprint
amdf generate-k8s Deployment --no-blueprint

# Generate without policy template
amdf generate-k8s Pod --no-policy-template

# Custom output directory
amdf generate-k8s ConfigMap --output ./k8s-schemas
```

**Supported Kubernetes Objects:**
- **Core**: Pod, Service, ConfigMap, Secret, ServiceAccount, PersistentVolume, PersistentVolumeClaim, Namespace, Node
- **Apps**: Deployment, ReplicaSet, DaemonSet, StatefulSet
- **Networking**: Ingress, NetworkPolicy, IngressClass
- **Storage**: StorageClass, VolumeAttachment, CSIDriver
- **RBAC**: Role, RoleBinding, ClusterRole, ClusterRoleBinding
- **Batch**: Job, CronJob
- **Autoscaling**: HorizontalPodAutoscaler
- **Policy**: PodDisruptionBudget
- And many more...

**Output:**
```
Generating schema for Kubernetes Pod (v1.35.0)
✅ Schema generated: library/models/k8s/v1/k8s_v1_Pod.k
✅ Blueprint generated: library/blueprints/Pod.k
✅ Policy template created: library/policies/PodPolicy.k
✅ Example main.k generated: library/main.k

🎉 Generation completed successfully!
```