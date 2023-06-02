-- AlterTable
ALTER TABLE "ClientSetting" ADD COLUMN     "freightFree" DOUBLE PRECISION NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "ClientFreight" (
    "id" SERIAL NOT NULL,
    "clientId" INTEGER NOT NULL,
    "distance" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "price" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClientFreight_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ClientFreight" ADD CONSTRAINT "ClientFreight_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
