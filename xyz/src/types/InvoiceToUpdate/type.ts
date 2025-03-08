import { z } from "zod";

export const InvoiceToUpdateSchema = z.object({
  customerID: z.number().int().optional(),
  transactionID: z.number().int().optional(),
  invoiceDate: z.string().datetime().optional(),
  dueDate: z.string().datetime().optional(),
  totalAmount: z.number().optional(),
  status: z.string().max(255).optional()
});

export type InvoiceToUpdate = z.infer<typeof InvoiceToUpdateSchema>;
