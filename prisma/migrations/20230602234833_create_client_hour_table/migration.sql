-- CreateTable
CREATE TABLE "ClientHour" (
    "id" SERIAL NOT NULL,
    "clientId" INTEGER NOT NULL,
    "day" INTEGER NOT NULL,
    "open" TEXT NOT NULL,
    "close" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClientHour_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ClientHour" ADD CONSTRAINT "ClientHour_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
