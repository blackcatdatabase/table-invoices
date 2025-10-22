<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\Invoices\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Žádná logika; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class InvoiceDto {
    public function __construct(
        public readonly ?int $id,
        public readonly ?int $orderId,
        public readonly string $invoiceNumber,
        public readonly ?string $variableSymbol,
        public readonly \DateTimeImmutable $issueDate,
        public readonly ?\DateTimeImmutable $dueDate,
        public readonly string $subtotal,
        public readonly string $discountTotal,
        public readonly string $taxTotal,
        public readonly string $total,
        public readonly string $currency,
        public readonly ?string $qrData,
        public readonly \DateTimeImmutable $createdAt
    ) {}

    /** Vhodné pro serializaci/logování (bez binárních/velkých blobů). */
    public function toArray(): array {
        // get_object_vars funguje dobře s public readonly vlastnostmi
        return get_object_vars($this);
    }
}
