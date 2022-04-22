class Validators {
  static String validateName({required String? name}) {
    if (name == null || name.isEmpty) {
      return 'Nombre vacío';
    }

    return '';
  }

  static String validateEmail({required String? email}) {
    if (email == null || email.isEmpty) {
      return 'Correo electrónico vacío';
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (!emailRegExp.hasMatch(email)) {
      return 'Inserte un correo electrónico válido';
    }

    return '';
  }

  static String validatePassword({required String? password}) {
    if (password == null || password.isEmpty) {
      return 'Contraseña vacía';
    } else if (password.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    return '';
  }
}
