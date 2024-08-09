
class TValidator {

  static String? validateEmpyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese $fieldName.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
      return 'Se requiere una cuenta de Correo';
    }

    // Validar que tenga el formato de correo
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Cuenta de correo No Valida';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Se requiere una contraseña';
    }

    // Caracteres minimos
    if (value.length < 6) {
      return 'La contraseña debe de 6 caracteres o mas larga';
    }

    // Mayuscuals 
    if (!value.contains(RegExp(r'[A-Z]'))){
      return 'La contraseña debe contener al menos una Mayúscula';
    }

    // Numeros
    if (!value.contains(RegExp(r'[0-9]'))){
      return 'La contraseña debe contener al menos un Numero';
    }

    // Caracteres Especiales
    if (!value.contains(RegExp(r'[!@#$%^&*()_+<>?:"{},.|]'))){
      return 'La contraseña debe contener al menos un Carácter Especial';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Se requiere un número de teléfono';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)){
      return 'Formato no valido (Se requieren 10 dígitos)';
    }
    return null;
  }
}