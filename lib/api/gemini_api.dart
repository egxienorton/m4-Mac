abstract class IGeminiAPI {

  // Upload vs summarize and give prompt (dio to the challenge)
  Future uploadVideo() async {}
  Future transcribeAudio() async {}
  Future uploadPicture() async {}
  Future uploadFile() async {}
  Future convertPdf() async {}
  Future makePresentation() async {}
}


class GeminiApi  implements IGeminiAPI{
  @override
  Future convertPdf() {
    // TODO: implement convertPdf
    throw UnimplementedError();
  }

  @override
  Future makePresentation() {
    // TODO: implement makePresentation
    throw UnimplementedError();
  }

  @override
  Future transcribeAudio() {
    // TODO: implement transcribeAudio
    throw UnimplementedError();
  }

  @override
  Future uploadFile() {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }

  @override
  Future uploadPicture() {
    // TODO: implement uploadPicture
    throw UnimplementedError();
  }

  @override
  Future uploadVideo() {
    // TODO: implement uploadVideo
    throw UnimplementedError();
  }
}