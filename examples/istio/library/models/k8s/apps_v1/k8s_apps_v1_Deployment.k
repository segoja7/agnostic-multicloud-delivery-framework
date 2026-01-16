"""
This file was generated automatically from Kubernetes OpenAPI specification.
DO NOT EDIT MANUALLY.
"""

schema Deployment:
    """
    Deployment enables declarative updates for Pods and ReplicaSets.

    Attributes
    ----------
    apiVersion : str, optional
        APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, optional
        Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : DeploymentMetadata, optional
        ObjectMeta is metadata that all persisted resources must have, which includes all objects users must create.
    spec : DeploymentSpec, optional
        DeploymentSpec is the specification of the desired behavior of the Deployment.
    status : DeploymentStatus, optional
        DeploymentStatus is the most recently observed status of the Deployment.
    """
    apiVersion : str = "apps/v1"
    kind : str = "Deployment"
    metadata? : DeploymentMetadata
    spec? : DeploymentSpec
    status? : DeploymentStatus

schema DeploymentMetadata:
    """
    ObjectMeta is metadata that all persisted resources must have, which includes all objects users must create.

    Attributes
    ----------
    annotations : {str:str}, optional
        Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations
    creationTimestamp : any, optional
        CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC.  Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    deletionGracePeriodSeconds : int, optional
        Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only.
    deletionTimestamp : any, optional
        DeletionTimestamp is RFC 3339 date and time at which this resource will be deleted. This field is set by the server when a graceful deletion is requested by the user, and is not directly settable by a client. The resource is expected to be deleted (no longer visible from resource lists, and not reachable by name) after the time in this field, once the finalizers list is empty. As long as the finalizers list contains items, deletion is blocked. Once the deletionTimestamp is set, this value may not be unset or be set further into the future, although it may be shortened or the resource may be deleted prior to this time. For example, a user may request that a pod is deleted in 30 seconds. The Kubelet will react by sending a graceful termination signal to the containers in the pod. After that 30 seconds, the Kubelet will send a hard termination signal (SIGKILL) to the container and after cleanup, remove the pod from the API. In the presence of network partitions, this object may still exist after this timestamp, until an administrator or automated process can determine the resource is fully terminated. If not set, graceful deletion of the object has not been requested.  Populated by the system when a graceful deletion is requested. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    finalizers : [str], optional
        Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed. Finalizers may be processed and removed in any order.  Order is NOT enforced because it introduces significant risk of stuck finalizers. finalizers is a shared field, any actor with permission can reorder it. If the finalizer list is processed in order, then this can lead to a situation in which the component responsible for the first finalizer in the list is waiting for a signal (field value, external system, or other) produced by a component responsible for a finalizer later in the list, resulting in a deadlock. Without enforced ordering finalizers are free to order amongst themselves and are not vulnerable to ordering changes in the list.
    generateName : str, optional
        GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided. If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with a unique suffix. The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.  If this field is specified and the generated name exists, the server will return a 409.  Applied only if Name is not specified. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
    generation : int, optional
        A sequence number representing a specific generation of the desired state. Populated by the system. Read-only.
    labels : {str:str}, optional
        Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels
    managedFields : [any], optional
        ManagedFields maps workflow-id and version to the set of fields that are managed by that workflow. This is mostly for internal housekeeping, and users typically shouldn't need to set or understand this field. A workflow can be the user's name, a controller's name, or the name of a specific apply path like "ci-cd". The set of fields is always in the version that the workflow used when modifying the object.
    name : str, optional
        Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names#names
    namespace : str, optional
        Namespace defines the space within which each name must be unique. An empty namespace is equivalent to the "default" namespace, but "default" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.  Must be a DNS_LABEL. Cannot be updated. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces
    ownerReferences : [any], optional
        List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller.
    resourceVersion : str, optional
        An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.  Populated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
    selfLink : str, optional
        Deprecated: selfLink is a legacy read-only field that is no longer populated by the system.
    uid : str, optional
        UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.  Populated by the system. Read-only. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names#uids
    """
    annotations? : {str:str}
    creationTimestamp? : any
    deletionGracePeriodSeconds? : int
    deletionTimestamp? : any
    finalizers? : [str]
    generateName? : str
    generation? : int
    labels? : {str:str}
    managedFields? : [any]
    name? : str
    namespace? : str
    ownerReferences? : [any]
    resourceVersion? : str
    selfLink? : str
    uid? : str

schema DeploymentSpec:
    """
    DeploymentSpec is the specification of the desired behavior of the Deployment.

    Attributes
    ----------
    minReadySeconds : int, optional
        Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
    paused : bool, optional
        Indicates that the deployment is paused.
    progressDeadlineSeconds : int, optional
        The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. Defaults to 600s.
    replicas : int, optional
        Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
    revisionHistoryLimit : int, optional
        The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
    selector : any
        Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment. It must match the pod template's labels.
    strategy : any, optional
        The deployment strategy to use to replace existing pods with new ones.
    template : any
        Template describes the pods that will be created. The only allowed template.spec.restartPolicy value is "Always".
    """
    minReadySeconds? : int
    paused? : bool
    progressDeadlineSeconds? : int
    replicas? : int
    revisionHistoryLimit? : int
    selector : any
    strategy? : any
    template : any

schema DeploymentStatus:
    """
    DeploymentStatus is the most recently observed status of the Deployment.

    Attributes
    ----------
    availableReplicas : int, optional
        Total number of available non-terminating pods (ready for at least minReadySeconds) targeted by this deployment.
    collisionCount : int, optional
        Count of hash collisions for the Deployment. The Deployment controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ReplicaSet.
    conditions : [any], optional
        Represents the latest available observations of a deployment's current state.
    observedGeneration : int, optional
        The generation observed by the deployment controller.
    readyReplicas : int, optional
        Total number of non-terminating pods targeted by this Deployment with a Ready Condition.
    replicas : int, optional
        Total number of non-terminating pods targeted by this deployment (their labels match the selector).
    terminatingReplicas : int, optional
        Total number of terminating pods targeted by this deployment. Terminating pods have a non-null .metadata.deletionTimestamp and have not yet reached the Failed or Succeeded .status.phase.  This is a beta field and requires enabling DeploymentReplicaSetTerminatingReplicas feature (enabled by default).
    unavailableReplicas : int, optional
        Total number of unavailable pods targeted by this deployment. This is the total number of pods that are still required for the deployment to have 100% available capacity. They may either be pods that are running but not yet available or pods that still have not been created.
    updatedReplicas : int, optional
        Total number of non-terminating pods targeted by this deployment that have the desired template spec.
    """
    availableReplicas? : int
    collisionCount? : int
    conditions? : [any]
    observedGeneration? : int
    readyReplicas? : int
    replicas? : int
    terminatingReplicas? : int
    unavailableReplicas? : int
    updatedReplicas? : int