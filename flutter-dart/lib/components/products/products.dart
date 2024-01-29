
    class Products {
      final String id;
late final String name;
int? price;
      final String createdAt;
      final String updatedAt;

      Products({required this.id,
required this.name,
this.price,    
        required this.createdAt,
        required this.updatedAt});
    
      factory Products.fromMap(Map<String, dynamic> map) {
        return Products(
        id: map['_id'] as String,
name : map['name'] as String,
price : map['price'] as int
        createdAt: map['createdAt'] as String,
        updatedAt: map['updatedAt'] as String
        );
      }
    
      Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
data['name'] = name;
data['price'] = price;
        data['createdAt'] = createdAt;
        data['updatedAt'] = updatedAt;
        return data;
      }

      @override
      String toString() => 'Products(id: $id, name : $name)';
    }