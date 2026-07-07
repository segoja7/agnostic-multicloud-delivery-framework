# CHANGELOG

<!-- version list -->

## v1.6.0 (2026-07-07)

### Documentation

- Align documentation with current tool behavior
  ([`bce4c8b`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/bce4c8bf798e1c3a86867aa2f3e6a7437cea8c30))

### Features

- Remove Ollama integration and drop unused dependencies
  ([`7a0d48a`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/7a0d48a1aeb31ddbdbc40445a20f0325beb16933))


## v1.5.0 (2026-07-07)

### Bug Fixes

- Emit Undefined-safe policy checks and always-compiling main.k examples
  ([`7d4d52d`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/7d4d52d40af01dbb02cae0b40cf4e82a2a649620))

- Preserve PascalCase kinds and sanitize hyphenated CRD groups in generated paths
  ([`9dd1639`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/9dd1639541dfffe4a53a1bbb5a9e83bcd1c152a7))

### Chores

- Remove dead kyverno translator/manager and unused core modules
  ([`f3cbc65`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/f3cbc65e87c22c749ebf3e75071b19a1e3cc092c))

### Documentation

- Restructure CLI documentation
  ([`a581acd`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/a581acd348a38036633d43fb7da1f537b4970906))

### Features

- Add policy template display to MCP server output
  ([`597f49a`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/597f49ae921314cae6fb6a62529856e4398a3589))

- Generate main.k with usage examples and policy integration
  ([`81f5b41`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/81f5b415e7f78cf4761e474de14d7912ec7ea4ad))

- Integrate PolicyScaffolder into generate commands
  ([`61e8f82`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/61e8f82b9ec93a8c0772fb865595c6e9e9b8105e))

### Testing

- Add unit and e2e regression tests for generators and policies
  ([`9cba799`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/9cba799f2528d2d63b875d026bdf6f33df61f45e))


## v1.4.0 (2026-01-27)

### Features

- Add list-k8s in cli and mcp
  ([`d561b35`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/d561b350b460c82f0185580da1cc276e8e50bff7))


## v1.3.0 (2026-01-25)

### Features

- Add validate command for Kyverno policy validation
  ([`619acbe`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/619acbe3b714e84bf43e7837aa2e409301f1d206))


## v1.2.1 (2026-01-25)

### Bug Fixes

- Read version dynamically from package metadata
  ([`01e3fb1`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/01e3fb18c6ea52488ab25adf0aab28c752a5bcd8))


## v1.2.0 (2026-01-25)

### Features

- Add Kyverno policy integration and validation
  ([`3597f46`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/3597f4654815065d63d01c2f2da71892f7159a55))


## v1.1.0 (2026-01-25)

### Bug Fixes

- Escape ${...} in docstrings to avoid KCL interpolation error
  ([`a2eddf8`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/a2eddf882b22264723bae5ac1ebae3260e0bffbf))

### Documentation

- Update docs with new features and diagrams
  ([`c04bf66`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/c04bf66582b04cb64396d779fa0770dade2dbb48))

### Features

- Add basic example tofu with crossplane
  ([`d7e3eda`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/d7e3edaa923645e43ec9a0781a63bee02e007ed1))

- Add configurations pkg with oci example using crossplane
  ([`8e1275f`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/8e1275f094bad608c34617ed819ac29f30d20daa))

- Add istio example
  ([`9bbee7f`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/9bbee7fdf0e5bd588dfc2b801bffb716b5363bd1))

- Add kro basic example
  ([`0787a2b`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/0787a2b64cf80822294d6a26f26a6afbb7825fc5))

- Add support for k8s native objects
  ([`07adc44`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/07adc4420b470dbc3fd90278209fea5c412802a3))


## v1.0.2 (2026-01-14)

### Bug Fixes

- Support CRDs without apiVersion/kind in schema and typed dictionaries
  ([`9d86654`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/9d86654dbb5b98806867452cca35d18211999918))


## v1.0.0 (2026-01-13)


## v0.1.2 (2026-01-13)

### Features

- Add new cicd for releases
  ([`2a9cff5`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/2a9cff54307766147fc2a8d74a682fb360bf2bbf))

- Add new cicd for releases
  ([`c51ce71`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/c51ce7164a6c05e16f9e48bee640ab974eee5bdd))


## v0.1.1 (2026-01-13)

### Documentation

- Translated comments in code from spanish to english
  ([`678482d`](https://github.com/segoja7/agnostic-multicloud-delivery-framework/commit/678482d4892d40b5b149a35accde16bb3721b59f))


## v0.1.0 (2026-01-13)

- Initial Release
