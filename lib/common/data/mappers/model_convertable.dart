abstract mixin class ModelConvertable<M, E> {
  M toModel();

  E fromModel(M model) => throw UnimplementedError();
}
