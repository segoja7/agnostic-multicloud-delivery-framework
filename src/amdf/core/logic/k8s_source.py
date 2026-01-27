"""
Kubernetes native resource schema source using Kubernetes OpenAPI spec.
"""

import json
import urllib.request
from typing import Dict, List

# Map common kinds to their API versions and full schema names
resource_map = {
    "Pod": ("v1", "io.k8s.api.core.v1.Pod"),
    "Service": ("v1", "io.k8s.api.core.v1.Service"),
    "ConfigMap": ("v1", "io.k8s.api.core.v1.ConfigMap"),
    "Secret": ("v1", "io.k8s.api.core.v1.Secret"),
    "Namespace": ("v1", "io.k8s.api.core.v1.Namespace"),
    "PersistentVolume": ("v1", "io.k8s.api.core.v1.PersistentVolume"),
    "PersistentVolumeClaim": ("v1", "io.k8s.api.core.v1.PersistentVolumeClaim"),
    "ServiceAccount": ("v1", "io.k8s.api.core.v1.ServiceAccount"),
    "Deployment": ("apps/v1", "io.k8s.api.apps.v1.Deployment"),
    "StatefulSet": ("apps/v1", "io.k8s.api.apps.v1.StatefulSet"),
    "DaemonSet": ("apps/v1", "io.k8s.api.apps.v1.DaemonSet"),
    "ReplicaSet": ("apps/v1", "io.k8s.api.apps.v1.ReplicaSet"),
    "Ingress": ("networking.k8s.io/v1", "io.k8s.api.networking.v1.Ingress"),
    "NetworkPolicy": ("networking.k8s.io/v1", "io.k8s.api.networking.v1.NetworkPolicy"),
    "Job": ("batch/v1", "io.k8s.api.batch.v1.Job"),
    "CronJob": ("batch/v1", "io.k8s.api.batch.v1.CronJob"),
    "HorizontalPodAutoscaler": ("autoscaling/v2", "io.k8s.api.autoscaling.v2.HorizontalPodAutoscaler"),
    "Role": ("rbac.authorization.k8s.io/v1", "io.k8s.api.rbac.v1.Role"),
    "RoleBinding": ("rbac.authorization.k8s.io/v1", "io.k8s.api.rbac.v1.RoleBinding"),
    "ClusterRole": ("rbac.authorization.k8s.io/v1", "io.k8s.api.rbac.v1.ClusterRole"),
    "ClusterRoleBinding": ("rbac.authorization.k8s.io/v1", "io.k8s.api.rbac.v1.ClusterRoleBinding"),
}


def list_available_k8s_kinds() -> List[str]:
    """Lists the native Kubernetes kinds available for schema generation."""
    return sorted(list(resource_map.keys()))


def get_k8s_native_schema(kind: str, k8s_version: str = "1.35.0") -> Dict:
    """
    Get OpenAPI schema for a Kubernetes native resource from kubernetes-json-schema.

    Args:
        kind: Resource kind (e.g., "Deployment", "Pod", "Service")
        k8s_version: Kubernetes version (default: "1.35.0")

    Returns:
        OpenAPI v3 schema dict compatible with KCLSchemaGenerator
    """
    # Map common kinds to their API versions and full schema names
    resource_map = {
        "Pod": ("v1", "io.k8s.api.core.v1.Pod"),
        "Service": ("v1", "io.k8s.api.core.v1.Service"),
        "ConfigMap": ("v1", "io.k8s.api.core.v1.ConfigMap"),
        "Secret": ("v1", "io.k8s.api.core.v1.Secret"),
        "Namespace": ("v1", "io.k8s.api.core.v1.Namespace"),
        "PersistentVolume": ("v1", "io.k8s.api.core.v1.PersistentVolume"),
        "PersistentVolumeClaim": ("v1", "io.k8s.api.core.v1.PersistentVolumeClaim"),
        "ServiceAccount": ("v1", "io.k8s.api.core.v1.ServiceAccount"),
        "Deployment": ("apps/v1", "io.k8s.api.apps.v1.Deployment"),
        "StatefulSet": ("apps/v1", "io.k8s.api.apps.v1.StatefulSet"),
        "DaemonSet": ("apps/v1", "io.k8s.api.apps.v1.DaemonSet"),
        "ReplicaSet": ("apps/v1", "io.k8s.api.apps.v1.ReplicaSet"),
        "Ingress": ("networking.k8s.io/v1", "io.k8s.api.networking.v1.Ingress"),
        "NetworkPolicy": ("networking.k8s.io/v1", "io.k8s.api.networking.v1.NetworkPolicy"),
        "Job": ("batch/v1", "io.k8s.api.batch.v1.Job"),
        "CronJob": ("batch/v1", "io.k8s.api.batch.v1.CronJob"),
        "HorizontalPodAutoscaler": ("autoscaling/v2", "io.k8s.api.autoscaling.v2.HorizontalPodAutoscaler"),
        "Role": ("rbac.authorization.k8s.io/v1", "io.k8s.api.rbac.v1.Role"),
        "RoleBinding": ("rbac.authorization.k8s.io/v1", "io.k8s.api.rbac.v1.RoleBinding"),
        "ClusterRole": ("rbac.authorization.k8s.io/v1", "io.k8s.api.rbac.v1.ClusterRole"),
        "ClusterRoleBinding": ("rbac.authorization.k8s.io/v1", "io.k8s.api.rbac.v1.ClusterRoleBinding"),
    }

    if kind not in resource_map:
        raise ValueError(
            f"Unknown Kubernetes resource kind: {kind}. "
            f"Supported kinds: {', '.join(resource_map.keys())}"
        )

    api_version, schema_name = resource_map[kind]

    # Fetch all definitions from kubernetes-json-schema
    # This file contains ALL Kubernetes type definitions with $ref resolved
    definitions_url = f"https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v{k8s_version}/_definitions.json"

    try:
        with urllib.request.urlopen(definitions_url) as response:
            all_definitions = json.loads(response.read())
    except Exception as e:
        raise RuntimeError(
            f"Failed to fetch Kubernetes definitions for version {k8s_version}: {e}. "
            f"Available versions: https://github.com/yannh/kubernetes-json-schema"
        )

    # Get all definitions
    definitions = all_definitions.get("definitions", {})

    # Get the specific schema for this resource
    schema = definitions.get(schema_name)
    if not schema:
        raise ValueError(
            f"Schema not found for {kind} ({schema_name}) in Kubernetes {k8s_version}"
        )

    # Transform to CRD-like structure for compatibility with existing generator
    # Include ALL definitions so nested types can be resolved
    group, version = api_version.split("/") if "/" in api_version else ("", api_version)

    schema_with_all_definitions = {
        **schema,
        "definitions": definitions  # Include all K8s definitions
    }

    crd_like_schema = {
        "spec": {
            "group": group or "core",
            "names": {
                "kind": kind,
                "plural": kind.lower() + "s",
            },
            "versions": [{
                "name": version,
                "served": True,
                "storage": True,
                "schema": {
                    "openAPIV3Schema": schema_with_all_definitions
                }
            }]
        }
    }

    return crd_like_schema