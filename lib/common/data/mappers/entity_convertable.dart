abstract mixin class EntityConvertable<M, E> {
  E toEntity();

  M fromEntity(E entity) => throw UnimplementedError();
}
