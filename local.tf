provider "local" {
  // attributes 
}

provider "random" {
  # Configuration options
}

resource "local_file" "country" {
	filename=var.filename
	content="My favourite country is ${random_shuffle.country_shuffle.result[0]}, and favourite food is ${data.local_file.food.content}"
	file_permission="0700"
	lifecycle { 
        create_before_destroy=true  
    }
}

resource "random_shuffle" "country_shuffle" {
  input        = ["India", "Germany", "USA", "London"]
  result_count = 1
}

data "local_file" "food" {
  filename = "./food.txt"
}

output country_id { 
    value = local_file.country.id
    description = "File resource ID" # optional 
}