# Users

### Columns
|    name    |    type     |
|:----------:|:-----------:|
|   name     |    string   |
|   email    |    string   |
|   password |    string   |

### Association
- has_many :groups through: :user_groups
- has_many :massages

#Groups

### Column
|    name    |    type     |
|:----------:|:-----------:|
|   name     |    string   |

### Association
- has_many :users through: :user_groups
- has_many :massages

#Massages

### Columns
|    name    |    type     |
|:----------:|:-----------:|
|   body     |    text     |
|   image    |    string   |
|  user_id   |  references |
|  group_id  |  references |

### Association
- belongs_to :user
- belongs_to :massage

#User_groups

### Columns
|    name    |    type     |
|:----------:|:-----------:|
|   user_id  |  reference  |
|  group_id  |  reference  |

### Association
- belongs_to :user
- belongs_to :group
