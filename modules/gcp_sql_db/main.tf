# Module sql-db
resource "google_sql_database_instance" "postgres" {
  name                = "${var.project_name}-postgres-instance"
  database_version    = var.db_version
  region              = var.db_region
  deletion_protection = var.db_deletion_protection
  settings {
    tier = var.db_machine_type
  }
  depends_on = [
    var.cloud_resourcemanager,
    var.sqladmin
  ]
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "google_sql_user" "sql_user" {
  name     = var.project_name
  instance = google_sql_database_instance.postgres.name
  password = random_password.password.result
  depends_on = [
    google_sql_database_instance.postgres,
    random_password.password
  ]
}
