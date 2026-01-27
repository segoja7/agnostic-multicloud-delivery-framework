# CLI Reference

Reference for the AMDF command-line interface.

## Installation

```bash
pip install amdf
```

## Global Options

| Option | Description |
|--------|-------------|
| `--help` | Show help message |
| `--version` | Show version information |

## Commands

### `amdf version`

Show AMDF version information.

```bash
amdf version
```

**Output:**
```
AMDF version: x.y.z
```


---

## Troubleshooting

### Common Issues

**Command not found:**
```bash
# Check installation
pip list | grep amdf

# Reinstall if needed
pip install -e . --force-reinstall
```

**No CRDs found:**
```bash
# Verify cluster access
kubectl get crds

# Check context
kubectl config current-context
```

**Permission denied:**
```bash
# Check CRD permissions
kubectl auth can-i get customresourcedefinitions
```


## See Also

- [MCP Integration](mcp.md) - Using AMDF with MCP
- [Examples](../examples/basic.md) - Practical examples
