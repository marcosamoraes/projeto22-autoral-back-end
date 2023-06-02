-- CreateEnum
CREATE TYPE "CouponType" AS ENUM ('PERCENTAGE', 'AMOUNT', 'FREE_FREIGHT', 'FREE_PRODUCT');

-- CreateTable
CREATE TABLE "Coupon" (
    "id" SERIAL NOT NULL,
    "clientId" INTEGER NOT NULL,
    "userId" INTEGER,
    "fidelityId" INTEGER NOT NULL,
    "type" "CouponType" NOT NULL DEFAULT 'PERCENTAGE',
    "name" TEXT NOT NULL,
    "value" DOUBLE PRECISION,
    "minOrder" DOUBLE PRECISION,
    "code" TEXT NOT NULL,
    "quantity" INTEGER,
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "expireAt" TIMESTAMP(3),
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Coupon_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Coupon" ADD CONSTRAINT "Coupon_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coupon" ADD CONSTRAINT "Coupon_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coupon" ADD CONSTRAINT "Coupon_fidelityId_fkey" FOREIGN KEY ("fidelityId") REFERENCES "Fidelity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
