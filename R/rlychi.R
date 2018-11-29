.packageName <- "rlychi"


#' Compute Lychi hash for a molecule
#'
#' The Layered Chemical Identifier (Lychi) is a unique representation of a
#' molecule, similar in concept to the InChI key. In contrast to the InChI
#' key it is layered, meaning that the hash can be split into different layers
#' that allows one to compare molecules at different levels of resolution.
#'
#' @param smiles A SMILES representation of the molecule
#' @param keto_enol If `TRUE` consider keto-enol tautomers, but can slow things down
#' @return A string representing the Lychi hash
#' @author Rajarshi Guha (\email{rajarshi.guha@@gmail.com})
#' @export
get.lychi <- function(smiles, keto_enol = FALSE) {
  tg <- .jnew("lychi/tautomers/SayleDelanyTautomerGenerator", as.integer(1001))
  msz <- .jnew("lychi/LyChIStandardizer",
               .jcast(tg, "lychi/TautomerGenerator"))
  msz$removeSaltOrSolvent(TRUE)
  mol <- .jcall("chemaxon/formats/MolImporter", "Lchemaxon/struc/Molecule;", "importMol", smiles)
  mol$valenceCheck()
  #valence_status <- mol$valenceCheck()
  #if (!valence_status) warning("Valence error")

  dim <- mol$getDim()
  msz$standardize(mol)

  hash <- msz$hashKey(mol)

  return(hash)
}
