.onLoad <- function(lib, pkg) {
  .jpackage(pkg, lib.loc = lib)
  #jar.lychi <- paste(lib,pkg,"inst/java","lychi-all-fe2ea2a.jar",sep=.Platform$file.sep)
  #print(jar.lychi)
  # dlp<-Sys.getenv("DYLD_LIBRARY_PATH")
  # if (dlp!="") { # for Mac OS X we need to remove X11 from lib-path
  #   Sys.setenv("DYLD_LIBRARY_PATH"=sub("/usr/X11R6/lib","",dlp))
  # }
  #
  # jar.lychi <- paste(lib,pkg,"cont","lychi-all-fe2ea2a.jar",sep=.Platform$file.sep)
  # .jinit(classpath=c(jar.lychi))
  #
  # # check Java Version
  # jv <- .jcall("java/lang/System", "S", "getProperty", "java.runtime.version")
  # if(substr(jv, 1L, 2L) == "1.") {
  #   jvn <- as.numeric(paste0(strsplit(jv, "[.]")[[1L]][1:2], collapse = "."))
  #   if(jvn < 1.8) stop("Java >= 8 is needed for this package but not available")
  # }
}
