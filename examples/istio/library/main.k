import blueprints.Peerauthentication

peer_test = Peerauthentication.PeerauthenticationBlueprint {
  _metadataName = "default"
  _namespace = "test-istio"
  _mtls = {
    mode = "STRICT"
  }

}

peer_istio = Peerauthentication.PeerauthenticationBlueprint {
  _metadataName = "default"
  _namespace = "istio-system"
  _mtls = {
    mode = "STRICT"
  }

}

items = [peer_test, peer_istio]
