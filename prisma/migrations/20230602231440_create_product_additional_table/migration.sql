-- CreateTable
CREATE TABLE "ProductAdditional" (
    "id" SERIAL NOT NULL,
    "groupId" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "sort" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProductAdditional_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ProductAdditional" ADD CONSTRAINT "ProductAdditional_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "ProductAdditionalGroup"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
