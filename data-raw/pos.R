pos_colors_jp <-
  purrr::set_names(c("#E69F00", "#56B4E9", "#009E73", "#F0E442",
                     "#0072B2", "#D55E00", "#CC79A7"),
                   c(intToUtf8(c(21517, 35422)),
                     intToUtf8(c(21161, 35422)),
                     intToUtf8(c(21205, 35422)),
                     intToUtf8(c(21161, 21205, 35422)),
                     intToUtf8(c(35352, 21495)),
                     intToUtf8(c(21103, 35422)),
                     intToUtf8(c(24418, 23481, 35422))))

usethis::use_data(pos_colors_jp, internal = TRUE, overwrite = TRUE)
