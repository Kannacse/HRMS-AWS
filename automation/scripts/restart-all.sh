#!/bin/bash

kubectl rollout restart deployment/hrms-backend -n hrms
kubectl rollout restart deployment/hrms-frontend -n hrms
