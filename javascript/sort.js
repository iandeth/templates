// sorting array of hashes
var arr = [
    { name: 'え' },
    { name: 'か' },
    { name: 'あ' }
];
arr.sort( function ( a, b ){
    if( a.name < b.name ){ return -1 };
    return 1; 
});
