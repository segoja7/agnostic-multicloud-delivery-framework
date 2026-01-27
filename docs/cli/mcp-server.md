# amdf mcp-server

Start the Model Context Protocol server.

```bash
amdf mcp-server
```

Exposes AMDF functionality through the MCP interface, enabling AI assistants and development tools to discover CRDs and generate schemas programmatically.

**MCP Client Configuration:**

```json
{
  "mcpServers": {
    "amdf": {
      "command": "amdf",
      "args": ["mcp-server"]
    }
  }
}
```