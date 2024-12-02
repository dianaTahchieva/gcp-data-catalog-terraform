# Create a Data Catalog Taxonomy
resource "google_data_catalog_taxonomy" "multiplexer_pii_taxonomy" {
  display_name = "Multiplexer PII Taxonomy"
  description  = "Taxonomy for sensitive data classification"
  project      = var.project_id
  region       = var.region
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
}

# Create Policy Tags for PII and Non-PII
resource "google_data_catalog_policy_tag" "pii_sensitive" {
  taxonomy     = google_data_catalog_taxonomy.multiplexer_pii_taxonomy.id
  display_name = "PII"
  description  = "Policy tag for Personally Identifiable Information"
}

resource "google_data_catalog_policy_tag" "non_pii_sensitive" {
  taxonomy     = google_data_catalog_taxonomy.multiplexer_pii_taxonomy.id
  display_name = "Non-PII"
  description  = "Policy tag for non-sensitive data"
}
