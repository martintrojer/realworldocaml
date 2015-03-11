type token =
  | TOpen
  | TClose
  | TNumber of string
  | TString of string
  | TSymbol of string
;;
