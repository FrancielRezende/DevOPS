resource "local_file" "games" {
  filename     = "/temp/favorite-games.txt"
  content  = "HORIZON"
}

resource "local_sensitive_file" "games" {
  filename     = "/root/favorite-games-also.txt"
  content  = "GOD OF WAR"
}