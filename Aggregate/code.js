db.persons.aggregate([
    {
        $match:{
        'dob.age':{$gt:50}
        }
    },
    {
        $group:{
            _id:{gender:'$gender'},
            number_persons: {$sum:1}
        }
    }
])
