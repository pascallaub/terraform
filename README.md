# Terraform Erste Schritte

Dieses Projekt dient als Einführungsübung in Infrastructure as Code (IaC) mit Terraform. Das Ziel ist es, eine einfache Terraform-Konfiguration zu erstellen, die einen Provider und Ressourcen definiert, und die ersten Terraform-Befehle auszuführen, um den Workflow zu verstehen.

## Projektstruktur

Das Projekt ist folgendermaßen organisiert:

```
terraform-first-steps/
├── .terraform/                    # Terraform Provider-Plugins (automatisch generiert)
├── screenshots/                   # Screenshots der Terraform-Befehle
│   ├── terraform-init.png        # Screenshot der erfolgreichen terraform init Ausgabe
│   └── terraform-plan.png        # Screenshot der erfolgreichen terraform plan Ausgabe
├── .terraform.lock.hcl           # Terraform Dependency Lock File
├── main.tf                       # Enthält Ressourcendefinitionen für Docker-Images und -Container
├── provider.tf                   # Definiert die Docker-Provider-Konfiguration
├── .gitignore                    # Git-Ignore-Datei für Terraform-spezifische Dateien
└── README.md                     # Dokumentation für das Projekt
```

## Aufgabenübersicht

In dieser Aufgabe haben wir die theoretischen Grundlagen von Terraform und Infrastructure as Code kennengelernt. Wir haben eine minimale Terraform-Konfiguration erstellt, die Folgendes beinhaltet:

- Einen Provider-Block für den Docker-Provider, konfiguriert für die Kommunikation mit dem lokalen Docker-Daemon
- Einen Ressourcen-Block für ein Docker-Image (`nginx_image`), das das `nginx:latest` Image lädt
- Einen Ressourcen-Block für einen Docker-Container (`simple_nginx_container`), der das zuvor definierte Docker-Image verwendet

## Terraform-Befehle

Die folgenden Terraform-Befehle wurden als Teil dieser Übung ausgeführt:

1. **terraform init**: Initialisiert das Terraform-Arbeitsverzeichnis und lädt die erforderlichen Provider-Plugins herunter
2. **terraform plan**: Zeigt die geplanten Aktionen an, die Terraform durchführen wird, und bestätigt, dass zwei Ressourcen (das Docker-Image und der Container) erstellt werden

## Screenshots

### Terraform Init - Erfolgreiche Initialisierung
![Terraform Init Screenshot](screenshots/terraform-init.png)

### Terraform Plan - Geplante Änderungen
![Terraform Plan Screenshot](screenshots/terraform-plan.png)

## Lernziele erreicht

Durch diese Aufgabe wurden folgende Lernziele erreicht:

- ✅ Eine minimale, lauffähige Terraform-Konfiguration geschrieben
- ✅ Einen Provider definiert und konfiguriert (provider Block, required_providers)
- ✅ Eine einfache Ressource definiert (resource Block)
- ✅ Den Zweck der Blöcke, Argumente und Sammlungen in HCL verstanden und angewendet
- ✅ `terraform init` ausgeführt, um Provider herunterzuladen
- ✅ `terraform plan` ausgeführt, um eine Vorschau der geplanten Änderungen zu sehen
- ✅ Den Output von `terraform plan` verstanden und interpretiert

## Reflexion

### Was ist die Rolle des provider Blocks?

Der provider Block definiert und konfiguriert den Anbieter (in diesem Fall Docker), mit dem Terraform kommuniziert. Er ist notwendig, weil Terraform wissen muss, wie es mit der jeweiligen Infrastruktur-Plattform interagieren soll.

### Was ist die Rolle des resource Blocks?

Der resource Block definiert eine spezifische Infrastruktur-Komponente (z.B. Docker-Container oder -Image). Im Gegensatz zum provider, der die Verbindung zur Plattform herstellt, repräsentiert eine resource eine konkrete Ressource, die erstellt, verwaltet oder gelöscht werden soll.

### Implizite Abhängigkeiten

Die implizite Abhängigkeit zwischen docker_container und docker_image wurde durch die Referenzierung `docker_image.nginx_image.name` im Container-Block erstellt. Terraform versteht automatisch, dass das Image vor dem Container erstellt werden muss.

### terraform init

Der Befehl `terraform init` lädt beim ersten Ausführen die erforderlichen Provider-Plugins herunter und initialisiert das Arbeitsverzeichnis. Dabei wird ein `.terraform`-Verzeichnis erstellt und eine Sperrdatei für Abhängigkeiten angelegt.

### terraform plan

Der Output von `terraform plan` zeigt eine Vorschau aller geplanten Änderungen an der Infrastruktur, bevor diese tatsächlich angewendet werden. Er gibt Aufschluss darüber, welche Ressourcen erstellt (+), geändert (~) oder gelöscht (-) werden würden.

## Fazit

Dieses Projekt bietet ein grundlegendes Verständnis der HCL-Syntax von Terraform, der Rollen von Providern und Ressourcen sowie der Wichtigkeit der Planung von Infrastruktur-Änderungen vor deren Anwendung.
