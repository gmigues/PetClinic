### VPC ###

resource "aws_vpc" "dev_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name

  }
}


### SUBNETS ###

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.public_Snet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

 tags = {
    "kubernetes.io/role/elb" = 1
    Name = "public"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.publicB_Snet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_b

 tags = {
    "kubernetes.io/role/elb" = 1
    Name = "public_b"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.private_Snet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "private-subnet"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.privateB_Snet_cidr
  availability_zone = var.availability_zone_b

  tags = {
    Name = "private-subnet-B"
    "kubernetes.io/role/internal-elb" = 1
  }
}


resource "aws_eip" "eip" {
  
  domain   = "vpc"
}

### IGW ###

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "main-gateway"
  }
}



### NAT Gateway ###

resource "aws_nat_gateway" "NatG" {
  subnet_id     = aws_subnet.public.id
  allocation_id = aws_eip.eip.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.gw]
}



### Route Tables ###


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NatG.id
  }

  tags = {
    Name = "private-route-table"
  }
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}


resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "publicB" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}


# Añadir recursos adicionales para la subred privada como NAT Gateway o Private Route Table si es necesario.