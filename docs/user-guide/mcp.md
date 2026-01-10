# MCP Integration

AMDF provides a Model Context Protocol (MCP) server for integration with AI assistants.

## Setup

**Configuration:**
Configure the MCP server in your MCP client configuration:

```json
{
  "mcpServers": {
    "amdf": {
      "command": "amdf-mcp",
      "autoApprove": ["list_k8s_crds", "process_crd_to_kcl"]
    }
  }
}
```


## Usage

### Discovery
```
"List all CRDs in my cluster"
"Show me CRDs containing 'ec2'"
```

### Generation
```
"Generate schema for instances.ec2.aws.upbound.io"
"Create blueprint for virtualservices.networking.istio.io"
```

## See Also

- [CLI Reference](cli.md) - Command-line interface
- [Examples](../examples/basic.md) - Practical examples
