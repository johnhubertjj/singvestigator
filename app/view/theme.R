box::use(
  bslib[bs_theme, bs_add_rules],
  sass[sass_file]
  )

theme <- bs_theme(primary = "purple") |>
  bs_add_rules(sass_file("app/styles/main.scss"))
