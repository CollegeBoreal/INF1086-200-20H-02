// Connecting to MySQL Server and working with a Collection

var mysqlx = require('mysqlx');

// Connect to server
var mySession = mysqlx.getSession( {
host: 'localhost', port: 33060,
user: 'etudiants', password: 'etudiants_1'} );

var myDb = mySession.getSchema('world_x');

// Create a new collection 'my_collection'
var myColl = myDb.createCollection('my_collection');

// Insert documents
myColl.add({_id: '1', name: 'Laurie', age: 19}).execute();
myColl.add({_id: '2', name: 'Nadya', age: 54}).execute();
myColl.add({_id: '3', name: 'Lukas', age: 32}).execute();

// Find a document
var docs = myColl.find('name like :param1 AND age < :param2').limit(1).
        bind('param1','L%').bind('param2',20).execute();

// Print document
print(docs.fetchOne());

// Drop the collection
myDb.dropCollection('my_collection');
