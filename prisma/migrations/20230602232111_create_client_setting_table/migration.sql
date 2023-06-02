-- CreateEnum
CREATE TYPE "OpeningStatus" AS ENUM ('OPEN', 'CLOSED', 'FOLLOWING_TIME');

-- AlterTable
ALTER TABLE "Client" ADD COLUMN     "domain" TEXT;

-- CreateTable
CREATE TABLE "ClientSetting" (
    "id" SERIAL NOT NULL,
    "clientId" INTEGER NOT NULL,
    "minOrder" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "allowWithdrawal" BOOLEAN NOT NULL DEFAULT false,
    "allowDelivery" BOOLEAN NOT NULL DEFAULT false,
    "deliveryRange" INTEGER NOT NULL DEFAULT 0,
    "deliveryTimeMin" INTEGER NOT NULL DEFAULT 0,
    "deliveryTimeMax" INTEGER NOT NULL DEFAULT 0,
    "openingStatus" "OpeningStatus" NOT NULL DEFAULT 'CLOSED',
    "colorPrimary" TEXT NOT NULL DEFAULT '#000000',
    "colorSecondary" TEXT NOT NULL DEFAULT '#ffffff',
    "about" TEXT,
    "facebook" TEXT,
    "instagram" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClientSetting_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ClientSetting" ADD CONSTRAINT "ClientSetting_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
