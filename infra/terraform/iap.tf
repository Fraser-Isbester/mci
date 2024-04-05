
# Configures the internal OAuth Consent screen.
resource "google_iap_brand" "internal" {
  support_email     = var.admin_email
  application_title = "MCI Incoporated"
}

# Configures a default internal oauth client.
resource "google_iap_client" "internal" {
  display_name = "Internal"
  brand        = google_iap_brand.internal.name
}
