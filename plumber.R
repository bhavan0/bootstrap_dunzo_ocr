library(plumber)
#* Return the text
#* @post /ImageToText
function(req, imageBit) {
  list(
    library(tesseract),
    library(base64enc),
    raw = req$postBody,
    input <- imageBit,
    x <- base64decode(input),
    fileConn<-file(tf <- tempfile(fileext = ".jepg"), "wb"),
    writeBin(x, fileConn),
    close(fileConn),
    result <- ocr(tf),
     return (result)
  )
}

