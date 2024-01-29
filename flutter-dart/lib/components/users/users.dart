
    class Users {
      final String id;
String? name;
String? email;
String? password;
      final String createdAt;
      final String updatedAt;

      Users({required this.id,
this.name,
this.email,
this.password,    
        required this.createdAt,
        required this.updatedAt});
    
      factory Users.fromMap(Map<String, dynamic> map) {
        return Users(
        id: map['_id'] as String,
name : map['name'] as String,
email : map['email'] as String,
password : map['password'] as String
        createdAt: map['createdAt'] as String,
        updatedAt: map['updatedAt'] as String
        );
      }
    
      Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
data['name'] = name;
data['email'] = email;
data['password'] = password;
        data['createdAt'] = createdAt;
        data['updatedAt'] = updatedAt;
        return data;
      }

      @override
      String toString() => 'Users(id: $id, name : $name, email : $email, password : $password)';
    }