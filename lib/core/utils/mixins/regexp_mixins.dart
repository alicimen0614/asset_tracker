mixin RegexpMixins {
  static const emailRegexp =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  static const passwordRegexp = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
}
