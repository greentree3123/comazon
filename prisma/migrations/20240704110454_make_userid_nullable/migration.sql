/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `UserPreference` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `orderId` to the `OrderItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productId` to the `OrderItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `UserPreference` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "userId" TEXT;

-- AlterTable
ALTER TABLE "OrderItem" ADD COLUMN     "orderId" TEXT NOT NULL,
ADD COLUMN     "productId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "UserPreference" ADD COLUMN     "userId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "UserPreference_userId_key" ON "UserPreference"("userId");

-- AddForeignKey
ALTER TABLE "UserPreference" ADD CONSTRAINT "UserPreference_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
