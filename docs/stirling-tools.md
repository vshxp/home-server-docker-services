# Stirling PDF

Self-hosted PDF manipulation tool.

## Overview

Stirling PDF is a locally hosted web-based PDF manipulation tool. It provides functionality similar to ILovePDF with features for merging, splitting, converting, and manipulating PDF files without uploading to external servers.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `frooodle/s-pdf:latest` |
| **Container Name** | `stirling-pdf` |
| **Internal Port** | `8080` |
| **Memory Limit** | `2048M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `DOCKER_ENABLE_SECURITY` | Enable authentication | `false` |
| `INSTALL_BOOK_AND_ADVANCED_HTML_OPS` | Extra features | `false` |
| `LANGS` | OCR languages | `en_GB` |
| `PRIVATE_DOMAIN` | Domain for Traefik | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/stirling/trainingData` | `/usr/share/tessdata` | OCR languages |
| `/Storage/.Docker/stirling/configs` | `/configs` | Configuration |
| `/Storage/.Docker/stirling/logs` | `/logs/` | Log files |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.stirling-pdf.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.stirling-pdf.loadbalancer.server.port=8080
```

## Features

### Basic Operations
- Merge PDFs
- Split PDFs
- Rotate pages
- Remove pages
- Reorder pages

### Conversion
- PDF to images
- Images to PDF
- PDF to Word/Excel
- HTML to PDF
- Markdown to PDF

### Security
- Add/remove password
- Add watermark
- Sign PDF
- Sanitize metadata

### OCR
- Extract text
- Add searchable text layer
- Multi-language support

## OCR Languages

Add more languages by downloading Tessdata:
```bash
# Download language data
wget https://github.com/tesseract-ocr/tessdata/raw/main/por.traineddata
# Place in trainingData volume
```

## Quick Start

1. Create `.env` file with domain
2. Start the service: `hsds setup`
3. Access via configured domain
4. Upload PDFs and process

## Privacy Benefits

- All processing done locally
- No data sent to external servers
- No tracking or analytics
- Full control over your documents

## Use Cases

- Merge multiple invoices
- Split large documents
- Add watermarks to reports
- Remove PDF passwords
- OCR scanned documents

## Resource Usage

PDF processing can be resource-intensive:
- Memory limit set to 2GB
- Large PDFs may require more
- OCR operations are CPU-heavy

## Links

- [GitHub Repository](https://github.com/Stirling-Tools/Stirling-PDF)
- [Documentation](https://stirlingtools.com/)
