# amdf generate

Generate KCL schema and blueprint from a Custom Resource Definition.

```bash
amdf generate CRD_NAME [OPTIONS]
```

**Options:**

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--output` | `-o` | TEXT | `.` | Output directory |
| `--context` | `-c` | TEXT | None | Kubernetes context |
| `--blueprint/--no-blueprint` | | BOOL | `True` | Generate blueprint |
| `--policy-template/--no-policy-template` | | BOOL | `True` | Generate policy template |

**Examples:**

```bash
# Generate from CRD (includes schema, blueprint, policy, and main.k)
amdf generate instances.ec2.aws.upbound.io

# Generate without blueprint
amdf generate instances.ec2.aws.upbound.io --no-blueprint

# Generate without policy template
amdf generate instances.ec2.aws.upbound.io --no-policy-template

# Custom output directory
amdf generate instances.ec2.aws.upbound.io --output ./schemas
```

**Output:**
```
Generating schema for CRD: instances.ec2.aws.upbound.io
✅ Schema generated: library/models/ec2_aws_upbound_io/v1beta1/...
✅ Blueprint generated: library/blueprints/Instance.k
✅ Policy template created: library/policies/InstancePolicy.k
✅ Example main.k generated: library/main.k

🎉 Generation completed successfully!
```