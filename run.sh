#!/bin/bash
POD=test

kubectl run --image=nginx ${POD}

while [[ $(kubectl get pods ${POD} -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; 
do 
    echo "waiting for pod \"${POD}\"" && sleep 1; 
done

kubectl exec -it ${POD} -- bash
kubectl delete pod ${POD}
