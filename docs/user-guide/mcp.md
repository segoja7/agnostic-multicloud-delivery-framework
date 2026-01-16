# MCP Integration

AMDF provides a Model Context Protocol (MCP) server for integration with AI assistants.

## Setup

**Configuration:**
Configure the MCP server in your MCP client configuration:

```json
{
  "mcpServers": {
    "amdf": {
      "command": "amdf-mcp"
    }
  }
}
```


## Usage

### Discovery
```
"List all CRDs in my cluster"
"Show me CRDs containing 'ec2'"
"What native Kubernetes objects can I generate schemas for?"
```

### Generation
```
"Generate schema for instances.ec2.aws.upbound.io"
"Create blueprint for virtualservices.networking.istio.io"
"Generate Kubernetes Pod schema"
"Create Service and Deployment blueprints"
"Generate schema for ConfigMap and Secret"
```

### Combined Workflows
```
"Generate Istio VirtualService and native Kubernetes Service schemas"
"Create blueprints for Crossplane Instance and Kubernetes Deployment"
"Generate complete application stack with Service, Deployment, and ConfigMap"
```

## See Also

- [CLI Reference](cli.md) - Command-line interface
- [Examples](../examples/basic.md) - Practical examples
