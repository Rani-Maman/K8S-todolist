{{/*
Expand the name of the chart.
*/}}
{{- define "todolist.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "todolist.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Todolist app (webui) name - configurable via values
*/}}
{{- define "todolist.todolistAppName" -}}
{{- printf "%s-%s" .Release.Name .Values.names.todolistApp | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Todolist Vue name - configurable via values
*/}}
{{- define "todolist.todolistVueName" -}}
{{- printf "%s-%s" .Release.Name .Values.names.todolistVue | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Todos API name - configurable via values
*/}}
{{- define "todolist.todosApiName" -}}
{{- printf "%s-%s" .Release.Name .Values.names.todosApi | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
MariaDB name - configurable via values
*/}}
{{- define "todolist.mariadbName" -}}
{{- .Values.names.mariadb | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Default backend name - configurable via values
*/}}
{{- define "todolist.defaultBackendName" -}}
{{- printf "%s-%s" .Release.Name .Values.names.defaultBackend | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Config name
*/}}
{{- define "todolist.configName" -}}
{{- printf "%s-config" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Secret name
*/}}
{{- define "todolist.secretName" -}}
{{- printf "%s-secret" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
MariaDB init configmap name
*/}}
{{- define "todolist.mariadbInitName" -}}
{{- printf "%s-mariadb-init" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Title image configmap name
*/}}
{{- define "todolist.titleImageName" -}}
{{- printf "%s-title-image" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
MariaDB PVC name
*/}}
{{- define "todolist.mariadbPvcName" -}}
{{- printf "%s-mariadb-pvc" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "todolist.labels" -}}
helm.sh/chart: {{ include "todolist.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels (pass app name + root)
*/}}
{{- define "todolist.selectorLabels" -}}
app: {{ .app }}
app.kubernetes.io/instance: {{ .root.Release.Name }}
{{- end }}
