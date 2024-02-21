import 'package:flutter/material.dart';

class AuthStateProvider with ChangeNotifier {
// TODO: Configurar o FirebaseAuth
}



/**

class AuthStateFirebaseService with ChangeNotifier implements AuthStateService {
  final _auth = FirebaseAuth.instance;
  // static, pois pertence à classe, e não à instancia
  static UserModel? _currentUser;

  @override
  UserModel? get currentUser => _currentUser;

  @override
  Future<UserModel?> get loggedUserData async {
    final userStoredData = await StorageData.getMap('userData');
    if (userStoredData.isNotEmpty) {
      // gerar user com dados vindos do FB e do DB, só a data vai prevalescer local
      _currentUser = await _toUserModel(
        null,
        uid: userStoredData['id'],
        name: userStoredData['name'],
        isActive: userStoredData['isActive'],
        expiresAt: DateTime.parse(
          userStoredData['expiresAt'],
        ),
      );
    }
    return _currentUser;
  }

  @override
  Future<void> login(String email, String password, bool continueLogged) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user == null) return;
    if (!user.emailVerified) throw ('E-mail não verificado.');
    if (continueLogged) {
      _currentUser = await _toUserModel(
        user,
        isActive: user.emailVerified,
        expiresAt: DateTime.now().add(
          const Duration(days: 30),
        ),
      );
      await _storeLocallyUserData(_currentUser!);
    } else {
      _currentUser = await _toUserModel(user, isActive: user.emailVerified);
      await _cleanStoredUserData();
    }
    // atualizar os interessados após as atualizações de currentUser
    notifyListeners();
  }

  @override
  Future<void> logout() async {
    // além de deslogar, vai limpar o user do cachê
    await _cleanStoredUserData();
    await _auth.signOut();
    _currentUser = null;
    notifyListeners();
  }

  @override
  Future<void> signUp(String email, String password, String name) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user == null) return;
    await user.updateDisplayName(name);
    await user.reload(); // ver se vai atualizar o nome
    _currentUser = await _toUserModel(
      user,
      isActive: false,
      isCreated: true,
      name: name,
    );
    await _saveUserDataOnDatabase(_currentUser!);
    await verifyEmail(email);

    // atualizar os interessados após as atualizações de currentUser
    notifyListeners();

    // Após o registro bem-sucedido, faça o login e atualize o estado de autenticação
    // await login(email, password, false);
  }

  // Enviar email de verificação do firebase para ativar o email
  Future<void> verifyEmail(String email) async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user == null) return;

    await user.sendEmailVerification();
  }

  /// ----------- FIRESTORE INICIO ------------
  // Salvar as informações de user pertinentes ao app no Firestore ou RealtimeDB
  Future<void> _saveUserDataOnDatabase(UserModel user) async {
    // Instanciar o Firestore
    final store = FirebaseFirestore.instance;
    // Definir o ID do documento que vai ser criado na collection de users
    final String userPath = FirebaseConstants.userCollectionName;
    final docRef = store.collection(userPath).doc(user.id);

    // Salvar no Firestore
    return docRef.set({
      'name': user.name,
      'email': user.email,
      // estou garantindo que vou ter um createdAt!
      'createdAt': user.createdAt!.toIso8601String(),
      'updatedAt': user.updatedAt?.toIso8601String(),
      'permissao': 'COMUM',
      'isActive': user.isActive,
    });
  }

  Future<UserModel?> _getUserAdditionalDataFromDB(String uid) async {
    final store = FirebaseFirestore.instance;
    final String userPath = FirebaseConstants.userCollectionName;
    final docRef = store.collection(userPath).doc(uid);
    final doc = await docRef.get();
    final data = doc.data();
    if (data == null) return null;
    return UserModel(
      id: doc.id,
      name: data['name'],
      email: data['email'],
      createdAt:
          data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
      updatedAt:
          data['updatedAt'] != null ? DateTime.parse(data['updatedAt']) : null,
      permissao: data['permissao'],
    );
  }
  // ----------- FIRESTORE FIM ------------

  // Converte um objeto User do Firebase em um UserModel personalizado
  _toUserModel(
    User? user, {
    String? uid,
    String? name,
    bool? isCreated,
    bool? isUpdated,
    DateTime? expiresAt,
    bool? isActive,
    String? permissao,
  }) async {
    final userFromDb =
        await _getUserAdditionalDataFromDB(user?.uid ?? uid ?? '');
    return UserModel(
      id: user?.uid ?? uid ?? '',
      name: name ?? user?.displayName ?? userFromDb?.name ?? '',
      email: user?.email ?? userFromDb?.email ?? '',
      createdAt:
          // se iscreated for vazio vai ser false
          isCreated ?? false ? DateTime.now() : userFromDb?.createdAt,
      updatedAt:
          // do mesmo jeito no isUpdated
          isUpdated ?? false ? DateTime.now() : userFromDb?.updatedAt,
      expiresAt: expiresAt ?? DateTime.now().add(const Duration(hours: 1)),
      isActive: userFromDb?.isActive ?? isActive ?? false,
      permissao: permissao ?? userFromDb?.permissao ?? 'COMUM',
    );
  }

  /// ------------ SHARED PREFERENCES - INICIO ------------
  Future<void> _storeLocallyUserData(UserModel user) async {
    await StorageData.saveMap('userData', {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'createdAt': user.createdAt?.toIso8601String(),
      'updatedAt': user.updatedAt?.toIso8601String(),
      'expiresAt': user.expiresAt?.toIso8601String(),
      'isActive': user.isActive,
      'permissao': 'COMUM',
    });
  }

  Future<void> _cleanStoredUserData() async {
    final userData = await StorageData.getMap('userData');
    if (userData.isNotEmpty) await StorageData.remove('userData');
  }
  // ------------ SHARED PREFERENCES - FIM ------------
}

 */