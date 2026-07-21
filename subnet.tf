resource "aws_subnet" "public" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "${var.aws_region}a"

  map_public_ip_on_launch = true


  tags = {

    Name = "${var.project_name}-public-subnet"

  }

}


resource "aws_subnet" "private" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.10.0/24"

  availability_zone = "${var.aws_region}a"


  tags = {

    Name = "${var.project_name}-private-subnet"

  }

}

resource "aws_subnet" "public_c" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-northeast-1c"

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-c"
  }
}


resource "aws_subnet" "private_c" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.20.0/24"

  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.project_name}-private-c"
  }
}
