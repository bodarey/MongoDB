db.persons.aggregate([{$match:{'dob.age':{$gt:50}}},
    {$group:{'_id':{gender:'$gender'}}}

])
