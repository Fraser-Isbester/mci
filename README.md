# Multi Cluster Ingress - MCI

Example MCI deployment.

## todo
- [~] Terraform
    - [ ] project w/ org attachment
    - [x] network
    - [x] control plane cluster
    - [ ] iap configuration
- [ ] cluster configuration
    - [ ] basic ingress configuration
    - [ ] config connector installation
    - [ ] workload cluster provisioning
    - [ ] gitops
    - [ ] weight-based multi-cluster ingress
    - [ ] l4/l7 service routing
- [ ] misc.
    - [ ] service installation


```mermaid
graph LR
    subgraph "Google Cloud"
        subgraph "VPC"
            subgraph "Region A"
                GKE1[GKE Cluster 1]
                MC1[MultiCluster Ingress]
            end
            subgraph "Region B"
                GKE2[GKE Cluster 2]
            end
        end
    end

    Internet -->|Ingress| MC1
    MC1 -->|routes to| GKE1
    MC1 -->|routes to| GKE2

    classDef gke fill:#4285f4,color:#fff;
    classDef mci fill:#34a853,color:#fff;
    classDef internet fill:#ea4335,color:#fff;
    class GKE1,GKE2 gke;
    class MC1 mci;
    class Internet internet;
```