#!/bin/bash

# Lấy danh sách các ManagedCluster có tên chứa "childshift"
CLUSTERS=$(oc get managedclusters -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')

for CLUSTER in $CLUSTERS; do
  echo "Labeling $CLUSTER with environment=childshift"
  oc label managedcluster $CLUSTER environment=childshift --overwrite
done
