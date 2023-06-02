/*
  Warnings:

  - You are about to drop the column `clientId` on the `User` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_clientId_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "clientId";

-- CreateTable
CREATE TABLE "UserXClient" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "clientId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserXClient_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UserXClient" ADD CONSTRAINT "UserXClient_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserXClient" ADD CONSTRAINT "UserXClient_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
