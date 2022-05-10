#' Word coloring according to part of speech
#'
#' @param x character vector
#' @param elem path to emphatic's hl_vec(elem = ...). "text" or "fill".
#' @param ... path to other function arguments.
#' @export
#' @rdname sazareishi
sazareishi <- function(x, elem = "text", ...) {
  .x <- NULL
  pos_col <-
    x %>%
    names() %>%
    emphatic::hl_vec(pos_colors_jp[1], .x == names(pos_colors_jp)[1], elem = elem) %>%
    emphatic::hl_vec(pos_colors_jp[2], .x == names(pos_colors_jp)[2], elem = elem) %>%
    emphatic::hl_vec(pos_colors_jp[3], .x == names(pos_colors_jp)[3], elem = elem) %>%
    emphatic::hl_vec(pos_colors_jp[4], .x == names(pos_colors_jp)[4], elem = elem) %>%
    emphatic::hl_vec(pos_colors_jp[5], .x == names(pos_colors_jp)[5], elem = elem) %>%
    emphatic::hl_vec(pos_colors_jp[6], .x == names(pos_colors_jp)[6], elem = elem) %>%
    emphatic::hl_vec(pos_colors_jp[7], .x == names(pos_colors_jp)[7], elem = elem)
  emphatic::hl_vec(x, attr(pos_col, elem), elem = elem)
}

#' @param df data.frame
#' @param token name for token variable
#' @param pos name for part of speech variable
#' @inheritDotParams sazareishi
#' @export
#' @rdname sazareishi
sazareishi_to_df <- function(df, token = token, pos = pos, ...) {
  pos_color_vec <-
    df %>%
    dplyr::pull({{ token }}) %>%
    purrr::set_names(df %>%
                       dplyr::pull({{ pos }})) %>%
    sazareishi(...)
  attr(df, "text") <-  structure(c(rep(NA,
                                       length(pos_color_vec)),
                                   attr(pos_color_vec, "text")),
                                 .Dim = c(length(pos_color_vec), ncol(df)))
  attr(df, "fill") <-  structure(c(rep(NA_character_,
                                       length(pos_color_vec) * ncol(df))),
                                 .Dim = c(length(pos_color_vec), ncol(df)))
  df %>%
    tibble::new_tibble(class = "emphatic")
}
