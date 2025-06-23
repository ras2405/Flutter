// 🧪 Desafío: Consulta Asíncrona de Perfil de Usuario
// Instrucciones:
// 1. Declara una excepción custom llamada InvalidUsernameException que extienda Exception.
// 2. Declara un enum UserRole con dos valores: admin y normal.
// 3. Declara una clase Usuario con las propiedades: name (String), age (int), hobbies (List<String>), role (UserRole).
// 4. Implementa la función getUserProfile para que:
//    - Lance InvalidUsernameException si el username es vacío.
//    - Simular un retraso de red de 500ms.
//    - Cree y retorne una instancia de Usuario con:
//       · name: nombre capitalizado (Inicial mayúscula)
//       · age: un entero fijo - si username == "admin", asigna 40, en caso contrario 24
//       · hobbies: lista de 2 hobbies ficticios
//       · role: asigna UserRole.admin si username == "admin", en caso contrario UserRole.normal
//       · bonus: un valor nullable para el calculo de salary.
// 5. Crea una función calculateSalary que reciba un Usuario y retorne un int:
//    - Si role es admin: salary = age * 1000.
//    - Si role es normal: salary = age * 500.
//    - Usa operadores de null safety en algún cálculo (Agregando un valor de bonificación opcional segun el usuario especifico).
// 6. En algún punto usa control de flujo con switch para evaluar el enum UserRole.
// 7. En algun punto usa control de flujo con 'if' o 'ternary operator'.

import 'dart:async';

//TODO: Declara una excepción custom llamada InvalidUsernameException que extienda Exception.
/// Excepción custom para usuario inválido
class InvalidUsernameException implements Exception {
  final String message;

  InvalidUsernameException(this.message);

  @override
  String toString() => 'InvalidUsernameException: $message';
}

//TODO: Declara un enum UserRole con dos valores: admin y normal.
/// Enum para rol de usuario
enum UserRole { admin, normal }

//TODO: Declara una clase Usuario con las propiedades: name (String), age (int), hobbies (List<String>), role (UserRole).
/// Clase Usuario
class Usuario {
  final String name;
  final int age;
  final List<String> hobbies;
  final UserRole role;
  final int? bonus;

  Usuario({
    required this.name,
    required this.age,
    required this.hobbies,
    required this.role,
    this.bonus,
  });
}

/// Simula una consulta asincrónica a una base de datos ficticia.
Future<Usuario> getUserProfile(String username) async {
  // TODO: Verifica que el username no sea vacío. Si lo es, lanza InvalidUsernameException.
  if (username.isEmpty) {
    throw InvalidUsernameException('El username no puede estar vacío.');
  }

  // TODO: Simula un delay de red usando Future.delayed.
  await Future.delayed(const Duration(milliseconds: 500));

  // TODO: Determina el rol según el username.
  final role = (username == 'admin') ? UserRole.admin : UserRole.normal;

  // TODO: Crea y retorna un Usuario ficticio.
  return Usuario(
    name: username[0].toUpperCase() + username.substring(1),
    age: role == UserRole.admin ? 40 : 24,
    hobbies: ['Leer', 'Programar'],
    role: role,
    bonus: (role == UserRole.admin) ? 100 : null, // Ejemplo de valor nullable
  );
}

/// Calcula el salario según el rol del usuario. Usa null safety en bonus.
int calculateSalary(Usuario user) {
  //TODO: Usa algun switch para evaluar el rol del usuario y calcular el salario.
  final int bonusValue = user.bonus ?? 0;

  switch (user.role) {
    case UserRole.admin:
      return user.age * 1000 + bonusValue;
    case UserRole.normal:
      return user.age * 500 + bonusValue;
  }
}

void main() async {
  print('✅ Iniciando tests de perfil...');

  //No modifiques el código de los tests

  try {
    final beginning = DateTime.now();
    final user = await getUserProfile('martin');
    final end = DateTime.now();
    assert(user is Usuario);
    assert(user.name == 'Martin');
    assert(user.age == 24);
    assert(user.hobbies is List<String>);
    assert(user.hobbies.length == 2);
    assert(user.role == UserRole.normal);
    assert(end.difference(beginning).inMilliseconds >= 500);
    print('✅ Test 1 de getUserProfile aprobado');
  } catch (e) {
    print('❌ Test 1 de getUserProfile falló: $e');
  }

  try {
    final user = await getUserProfile('');
    print('❌ Test 2 de getUserProfile falló: Se esperaba excepción');
  } on InvalidUsernameException catch (e) {
    print('✅ Test 2 de getUserProfile aprobado (excepción capturada): $e');
  } catch (e) {
    print(
      '❌ Test 2 de getUserProfile falló: Se esperaba InvalidUsernameException, pero se lanzó: $e',
    );
  }

  try {
    final admin = await getUserProfile('admin');
    final adminSalary = calculateSalary(admin);
    assert(adminSalary >= 40 * 1000);
    print('✅ Test 3 de salario (admin) aprobado');
  } catch (e) {
    print('❌ Test 3 de salario (admin) falló: $e');
  }

  try {
    final normalUser = await getUserProfile('martin');
    final normalSalary = calculateSalary(normalUser);
    assert(normalSalary == 24 * 500);
    print('✅ Test 4 de salario (normal) aprobado');
  } catch (e) {
    print('❌ Test 4 de salario (normal) falló: $e');
  }
}
