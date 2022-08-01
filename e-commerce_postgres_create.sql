CREATE TABLE "public.Products" (
	"id" serial NOT NULL,
	"productName" varchar(50) NOT NULL UNIQUE,
	"price" DECIMAL NOT NULL,
	"coverPic" TEXT NOT NULL,
	"category" TEXT NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Customers" (
	"id" serial NOT NULL,
	"name" varchar(40) NOT NULL,
	"email" varchar(60) NOT NULL UNIQUE,
	"senha" varchar(16) NOT NULL,
	CONSTRAINT "Customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Adresses" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"street" TEXT NOT NULL,
	"zipCode" varchar(8) NOT NULL,
	"number" varchar(6) NOT NULL,
	"complement" TEXT(6),
	CONSTRAINT "Adresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Pictures" (
	"id" serial NOT NULL,
	"picturePath" serial NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "Pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Storage" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"size" varchar(3) NOT NULL,
	"stock" integer NOT NULL,
	CONSTRAINT "Storage_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Sales" (
	"id" serial NOT NULL,
	"productInId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"orderId" integer NOT NULL,
	"productStatus" TEXT NOT NULL,
	"productStatus" TEXT NOT NULL,
	CONSTRAINT "Sales_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Orders" (
	"id" serial NOT NULL,
	"customerId" serial NOT NULL,
	"orderStatus" TEXT NOT NULL,
	"adressId" integer NOT NULL,
	CONSTRAINT "Orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "Adresses" ADD CONSTRAINT "Adresses_fk0" FOREIGN KEY ("customerId") REFERENCES "Customers"("id");

ALTER TABLE "Pictures" ADD CONSTRAINT "Pictures_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");

ALTER TABLE "Storage" ADD CONSTRAINT "Storage_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");

ALTER TABLE "Sales" ADD CONSTRAINT "Sales_fk0" FOREIGN KEY ("productInId") REFERENCES "Storage"("id");
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_fk1" FOREIGN KEY ("productStatus") REFERENCES "Orders"("id");

ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk0" FOREIGN KEY ("customerId") REFERENCES "Customers"("id");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk1" FOREIGN KEY ("adressId") REFERENCES "Adresses"("id");








