#!/bin/bash

curl -XPOST http://localhost:8000/initialize -H 'Content-Type: application/json' -d '{"payment_service_url":"http://payment:5555","shipment_service_url":"http://shipment:7000"}'
