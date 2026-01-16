"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Resourcegraphdefinition:
    """
    ResourceGraphDefinition is the core API for defining reusable groups of Kubernetes resources.
    It allows you to create custom resources that manage multiple underlying resources as a cohesive unit.
    When you create a ResourceGraphDefinition, kro automatically generates a CRD and deploys a controller
    to manage instances of your custom resource. Resources can reference each other using CEL expressions,
    and kro ensures they are created in the correct dependency order.

    Attributes
    ----------
    apiVersion : str, optional
        APIVersion defines the versioned schema of this representation of an object.
        Servers should convert recognized schemas to the latest internal value, and
        may reject unrecognized values.
        More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, optional
        Kind is a string value representing the REST resource this object represents.
        Servers may infer this from the endpoint the client submits requests to.
        Cannot be updated.
        In CamelCase.
        More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : any, optional
        No description available.
    spec : ResourcegraphdefinitionSpec, optional
        ResourceGraphDefinitionSpec defines the desired state of ResourceGraphDefinition.
        It contains the schema for instances (defining the CRD structure) and the list of
        Kubernetes resources that make up the graph.
    status : ResourcegraphdefinitionStatus, optional
        ResourceGraphDefinitionStatus defines the observed state of ResourceGraphDefinition.
        It provides information about the deployment state, resource ordering, and conditions.
    """
    apiVersion : str = "kro.run/v1alpha1"
    kind : str = "ResourceGraphDefinition"
    metadata? : any
    spec? : ResourcegraphdefinitionSpec
    status? : ResourcegraphdefinitionStatus

schema ResourcegraphdefinitionSpec:
    """
    ResourceGraphDefinitionSpec defines the desired state of ResourceGraphDefinition.
    It contains the schema for instances (defining the CRD structure) and the list of
    Kubernetes resources that make up the graph.

    Attributes
    ----------
    resources : [ResourcegraphdefinitionspecResourcesitem], optional
        Resources is the list of Kubernetes resources that will be created and managed
        for each instance. Resources can reference each other using CEL expressions,
        creating a dependency graph that determines creation order.
    schema : ResourcegraphdefinitionspecSchema, required
        Schema defines the structure of instances created from this ResourceGraphDefinition.
        It specifies the API version, kind, and fields (spec/status) for the generated CRD.
        Use SimpleSchema syntax to define the instance schema concisely.
    """
    resources? : [ResourcegraphdefinitionspecResourcesitem]
    schema : ResourcegraphdefinitionspecSchema

schema ResourcegraphdefinitionspecResourcesitem:
    """
    Resource represents a Kubernetes resource that is part of the ResourceGraphDefinition.
    Each resource can either be created using a template or reference an existing resource.
    Resources can depend on each other through CEL expressions, creating a dependency graph.

    Attributes
    ----------
    externalRef : ResourcegraphdefinitionspecresourcesitemExternalref, optional
        ExternalRef references an existing resource in the cluster instead of creating one.
        This is useful for reading existing resources and using their values in other resources.
        Exactly one of template or externalRef must be provided.
    id : str, required
        ID is a unique identifier for this resource within the ResourceGraphDefinition.
        It is used to reference this resource in CEL expressions from other resources.
        Example: "deployment", "service", "configmap".
    includeWhen : [str], optional
        IncludeWhen is a list of CEL expressions that determine whether this resource should be created.
        All expressions must evaluate to true for the resource to be included.
        If not specified, the resource is always included.
        Example: ["schema.spec.enableMonitoring == true"]
    readyWhen : [str], optional
        ReadyWhen is a list of CEL expressions that determine when this resource is considered ready.
        All expressions must evaluate to true for the resource to be ready.
        If not specified, the resource is considered ready when it exists.
        Example: ["self.status.phase == 'Running'", "self.status.readyReplicas > 0"]
    template : any, optional
        Template is the Kubernetes resource manifest to create.
        It can contain CEL expressions (using \${...} syntax) that reference other resources.
        Exactly one of template or externalRef must be provided.
    """
    externalRef? : ResourcegraphdefinitionspecresourcesitemExternalref
    id : str
    includeWhen? : [str]
    readyWhen? : [str]
    template? : any

schema ResourcegraphdefinitionspecresourcesitemExternalref:
    """
    ExternalRef references an existing resource in the cluster instead of creating one.
    This is useful for reading existing resources and using their values in other resources.
    Exactly one of template or externalRef must be provided.

    Attributes
    ----------
    apiVersion : str, required
        APIVersion is the API version of the external resource.
        Example: "v1" for core resources, "apps/v1" for Deployments.
    kind : str, required
        Kind is the kind of the external resource.
        Example: "Service", "ConfigMap", "Deployment".
    metadata : ResourcegraphdefinitionspecresourcesitemexternalrefMetadata, required
        Metadata contains the name and optional namespace of the external resource.
    """
    apiVersion : str
    kind : str
    metadata : ResourcegraphdefinitionspecresourcesitemexternalrefMetadata

schema ResourcegraphdefinitionspecresourcesitemexternalrefMetadata:
    """
    Metadata contains the name and optional namespace of the external resource.

    Attributes
    ----------
    name : str, required
        Name is the name of the external resource to reference.
        This field is required.
    namespace : str, optional
        Namespace is the namespace of the external resource.
        If empty, the instance's namespace will be used.
    """
    name : str
    namespace? : str

schema ResourcegraphdefinitionspecSchema:
    """
    Schema defines the structure of instances created from this ResourceGraphDefinition.
    It specifies the API version, kind, and fields (spec/status) for the generated CRD.
    Use SimpleSchema syntax to define the instance schema concisely.

    Attributes
    ----------
    additionalPrinterColumns : [ResourcegraphdefinitionspecschemaAdditionalprintercolumnsitem], optional
        AdditionalPrinterColumns defines additional printer columns
        that will be passed down to the created CRD. If set, no
        default printer columns will be added to the created CRD,
        and if default printer columns need to be retained, they
        need to be added explicitly.
    apiVersion : str, required
        APIVersion is the version identifier for the generated CRD.
        Must follow Kubernetes versioning conventions (v1, v1alpha1, v1beta1, etc.).
        This field is immutable after creation.
        Example: "v1alpha1", "v1", "v2beta1"
    group : str, optional
        Group is the API group for the generated CRD. Together with APIVersion and Kind,
        it forms the complete GVK (Group-Version-Kind) identifier.
        If omitted, defaults to "kro.run". This field is immutable after creation.
        Example: "mycompany.io", "databases.example.com"
    kind : str, required
        Kind is the name of the custom resource type that will be created.
        This becomes the kind field of the generated CRD and must be a valid Kubernetes kind name
        (PascalCase, starting with a capital letter). This field is immutable after creation.
        Example: "WebApplication", "Database", "MicroService"
    spec : any, optional
        Spec defines the schema for the instance's spec section using SimpleSchema syntax.
        This becomes the OpenAPI schema for instances of the generated CRD.
        Use SimpleSchema's concise syntax to define fields, types, defaults, and validations.
        Example: {"replicas": "integer | default=1 | min=1 | max=10"}
    status : any, optional
        Status defines the schema for the instance's status section using SimpleSchema syntax.
        Unlike spec, status fields use CEL expressions to project values from underlying resources.
        This allows you to surface important information from managed resources at the instance level.
        Example: {"connectionName": "\${database.status.connectionName}", "endpoint": "\${service.status.loadBalancer.ingress[0].hostname}"}
    types : any, optional
        Types is a map of custom type definitions that can be referenced in the Spec.
        This allows you to define reusable complex types using SimpleSchema syntax.
        Reference custom types in Spec using the type name.
        Example: {"Server": {"host": "string", "port": "integer"}}
    """
    additionalPrinterColumns? : [ResourcegraphdefinitionspecschemaAdditionalprintercolumnsitem]
    apiVersion : str
    group? : str
    kind : str
    spec? : any
    status? : any
    types? : any

schema ResourcegraphdefinitionspecschemaAdditionalprintercolumnsitem:
    """
    CustomResourceColumnDefinition specifies a column for server side printing.

    Attributes
    ----------
    description : str, optional
        description is a human readable description of this column.
    format : str, optional
        format is an optional OpenAPI type definition for this column. The 'name' format is applied
        to the primary identifier column to assist in clients identifying column is the resource name.
        See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
    jsonPath : str, required
        jsonPath is a simple JSON path (i.e. with array notation) which is evaluated against
        each custom resource to produce the value for this column.
    name : str, required
        name is a human readable name for the column.
    priority : int, optional
        priority is an integer defining the relative importance of this column compared to others. Lower
        numbers are considered higher priority. Columns that may be omitted in limited space scenarios
        should be given a priority greater than 0.
    type : str, required
        type is an OpenAPI type definition for this column.
        See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
    """
    description? : str
    format? : str
    jsonPath : str
    name : str
    priority? : int
    type : str

schema ResourcegraphdefinitionStatus:
    """
    ResourceGraphDefinitionStatus defines the observed state of ResourceGraphDefinition.
    It provides information about the deployment state, resource ordering, and conditions.

    Attributes
    ----------
    conditions : [ResourcegraphdefinitionstatusConditionsitem], optional
        Conditions represent the latest available observations of the ResourceGraphDefinition's state.
        Common condition types include "Ready", "Validated", and "ReconcilerDeployed".
    resources : [ResourcegraphdefinitionstatusResourcesitem], optional
        Resources provides detailed information about each resource in the graph,
        including their dependencies.
    state : str, optional
        State indicates whether the ResourceGraphDefinition is Active or Inactive.
        Active means the CRD has been created and the controller is running.
        Inactive means the ResourceGraphDefinition has been disabled or encountered an error.
    topologicalOrder : [str], optional
        TopologicalOrder is the ordered list of resource IDs based on their dependencies.
        Resources are created in this order to ensure dependencies are satisfied.
        Example: ["configmap", "deployment", "service"]
    """
    conditions? : [ResourcegraphdefinitionstatusConditionsitem]
    resources? : [ResourcegraphdefinitionstatusResourcesitem]
    state? : str
    topologicalOrder? : [str]

schema ResourcegraphdefinitionstatusConditionsitem:
    """
    Condition is the common struct used by all CRDs managed by ACK service
    controllers to indicate terminal states  of the CR and its backend AWS
    service API resource

    Attributes
    ----------
    lastTransitionTime : str, optional
        Last time the condition transitioned from one status to another.
    message : str, optional
        A human-readable message indicating details about the transition.
    observedGeneration : int, optional
        observedGeneration represents the .metadata.generation that the condition was set based upon.
        For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date
        with respect to the current state of the instance.
    reason : str, optional
        The reason for the condition's last transition.
    status : str, required
        Status of the condition, one of True, False, Unknown.
    type : str, required
        Type is the type of the Condition
    """
    lastTransitionTime? : str
    message? : str
    observedGeneration? : int
    reason? : str
    status : str
    type : str

schema ResourcegraphdefinitionstatusResourcesitem:
    """
    ResourceInformation provides detailed information about a specific resource
    in the ResourceGraphDefinition, particularly its dependencies on other resources.

    Attributes
    ----------
    dependencies : [ResourcegraphdefinitionstatusresourcesitemDependenciesitem], optional
        Dependencies lists all resources that this resource depends on.
        A resource depends on another if it references it in a CEL expression.
        These dependencies determine the order of resource creation.
    id : str, optional
        ID is the unique identifier of the resource as defined in the resources list.
    """
    dependencies? : [ResourcegraphdefinitionstatusresourcesitemDependenciesitem]
    id? : str

schema ResourcegraphdefinitionstatusresourcesitemDependenciesitem:
    """
    Dependency represents a dependency relationship between resources.
    When a resource uses CEL expressions to reference another resource,
    a dependency is created to ensure proper ordering.

    Attributes
    ----------
    id : str, optional
        ID is the unique identifier of the resource that this resource depends on.
    """
    id? : str