# amdf guided

Interactive schema generation with step-by-step workflow.

```bash
amdf guided [OPTIONS]
```

**Options:**

| Option | Type | Description |
|--------|------|-------------|
| `--ai-model` | TEXT | Enable AI explanations with specified Ollama model |

**Workflow:**

1. Choose resource type (CRD or Kubernetes native)
2. Filter and select resource
3. Generate schema, blueprint, and policies
4. (Optional) Get AI explanation of generated files

**Example:**

```bash
# Basic mode
amdf guided

# With AI explanations (requires Ollama)
amdf guided --ai-model qwen3-coder:30b
```

**Output:**
```
Step 1: Choose Resource Type
1. CRD (Custom Resource Definition)
2. Kubernetes Native (Pod, Service, Deployment, etc.)
Select type [1/2] (1): 2

Step 3: Select Resource
┏━━━━━━┳━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━┓
┃ #    ┃ Kind       ┃ API Group/Version ┃
┡━━━━━━╇━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━┩
│ 1    │ Pod        │ v1                │
│ 2    │ Service    │ v1                │
└──────┴────────────┴───────────────────┘
Select number (1-2): 1

⚙️ Generating for: Pod (v1.35.0)...
✅ Schema: library/models/k8s/v1/k8s_v1_Pod.k
✅ Blueprint: library/blueprints/Pod.k
✅ Policy template: library/policies/PodPolicy.k
✅ Example main.k: library/main.k

🎉 Complete!
```