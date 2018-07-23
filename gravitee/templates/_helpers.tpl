{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "gravitee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gravitee.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified gateway name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gravitee.gateway.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.gateway.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.gateway.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified gateway name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gravitee.api.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified gateway name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gravitee.ui.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create mongodb URI
*/}}
{{- define "mongodb_uri" -}}
  {{- printf "mongodb://" -}}
  {{- if .Values.mongodb.username -}}
    {{- printf "%s" .Values.mongodb.username -}}
    {{- if .Values.mongodb.password -}}
      {{- printf ":%s" .Values.mongodb.password -}}
    {{- end -}}
    {{- printf "@" -}}
  {{- end -}}
  {{- range $key, $value := .Values.mongodb.hosts -}}
    {{- if eq $key 0 -}}
      {{- printf "%s" $value -}}
    {{- else -}}
      {{- printf ",%s" $value -}}
    {{- end -}}
  {{- end -}}
  {{- printf "/" -}}
  {{- if .Values.mongodb.dbname -}}
    {{- printf "%s" .Values.mongodb.dbname -}}
  {{- end -}}
  {{- if .Values.mongodb.options -}}
    {{- printf "?" }}
    {{- range $key, $value := .Values.mongodb.options -}}
      {{- if eq $key 0 -}}
        {{- printf "%s" $value -}}
      {{- else -}}
        {{- printf "&%s" $value -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end }}