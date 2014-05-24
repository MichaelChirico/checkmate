#' Check if an object is an integerish vector
#'
#' @templateVar fn Integerish
#' @template na-handling
#' @template checker
#' @inheritParams checkInteger
#' @param tol [\code{double(1)}]\cr
#'  Numerical tolerance used to check if a double or complex can be converted.
#'  Default is \code{sqrt(.Machine$double.eps)}.
#' @param ... [ANY]\cr
#'  Additional parameters used in a call of \code{\link{checkVector}}.
#' @family basetypes
#' @export
#' @useDynLib checkmate c_is_integerish
#' @examples
#'  testIntegerish(1L)
#'  testIntegerish(1.)
#'  testIntegerish(1:2, lower = 1L, upper = 2L, any.missing = FALSE)
checkIntegerish = function(x, lower = -Inf, upper = Inf, tol = .Machine$double.eps^.5, ...) {
  if (!isIntegerish(x, tol) && !allMissingAtomic(x))
    return("Must be integerish")
  checkVectorProps(x, ...) %and% checkBounds(x, lower, upper)
}

#' @rdname checkIntegerish
#' @export
assertIntegerish = function(x, lower = -Inf, upper = Inf, tol = .Machine$double.eps^.5, ..., .var.name) {
  makeAssertion(checkIntegerish(x, lower, upper, tol, ...), vname(x, .var.name))
}

#' @rdname checkIntegerish
#' @export
testIntegerish = function(x, lower = -Inf, upper = Inf, tol = .Machine$double.eps^.5, ...) {
  isTRUE(checkIntegerish(x, lower, upper, tol, ...))
}