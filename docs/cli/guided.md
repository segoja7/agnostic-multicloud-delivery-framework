# amdf guided

Interactive schema generation with step-by-step workflow.

```bash
amdf guided
```

**Workflow:**

1. Filter CRDs by text (or press Enter to list all)
2. Select a CRD by number or full name
3. AMDF generates the schema, blueprint, policy template, and example `main.k`

**Example session:**

```
Step 1: Filter CRDs
Filter CRDs (or Enter for all): external-secrets

Step 2: Select CRD (12 found)
┏━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ #    ┃ CRD Name                                    ┃
┡━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ 1    │ acraccesstokens.generators.external-secr... │
│ 2    │ externalsecrets.external-secrets.io         │
└──────┴─────────────────────────────────────────────┘
Select number (1-12) or full name: 2

Step 3: Generate Schema
⚙️ Generating for: externalsecrets.external-secrets.io...
✅ Schema: library/models/external_secrets_io/v1/external_secrets_io_v1_ExternalSecret.k
✅ Blueprint: library/blueprints/ExternalSecret.k

🎉 Complete!
```

!!! note
    Guided mode works with cluster CRDs. For native Kubernetes resources
    (Pod, Deployment, Service, ...) use [`amdf generate-k8s`](generate-k8s.md).
