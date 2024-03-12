#Create Categories
casual = Category.create(name: 'Casual')
formal = Category.create(name: 'Formal')
party = Category.create(name: 'Party Wear')
beachwear = Category.create(name: 'Beachwear')



# Create Dresses
Dress.create(name: 'Blue Denim Dress', color: 'Blue', price: 39.99, material: 'Denim', stock: 30, category: casual, size: 'XS')
Dress.create(name: 'White Shirt Dress', color: 'White', price: 45.99, material: 'Cotton', stock: 25, category: casual, size: 's')
 Dress.create(name: 'Black Tuxedo',color: 'Black', price: 149.99, material: 'Wool', stock: 15, category: formal,size:'s')
Dress.create(name: 'Red Party Gown', color: 'Red', price: 89.99, material: 'Satin', stock: 20, category: party,size:'L')
 Dress.create(name: 'Beach Maxi Dress', color: 'Pink', price: 29.99, material: 'Chiffon', stock: 40, category: beachwear,size:'M')
Dress.create(name: 'Floral Sundress', color: 'Yellow', price: 34.99, material: 'Cotton', stock: 35, category: casual,size:'XL')
Dress.create(name: 'Navy Blue Suit', color: 'Navy Blue', price: 129.99, material: 'Polyester', stock: 10, category: formal,size:'XS')
 Dress.create(name: 'Strapless Cocktail Dress', color: 'Black', price: 59.99, material: 'Satin', stock: 20, category: party,size:'S')
Dress.create(name: 'Striped Beach Cover-up', color: 'Blue/White', price: 19.99, material: 'Polyester', stock: 50, category: beachwear,size: 'XXL')
 Dress.create(name: 'Plaid Shirt Dress',color: 'Red/Black', price: 39.99, material: 'Cotton', stock: 25, category: casual,size:'S')

