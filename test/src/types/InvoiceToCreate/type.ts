import { z } from "zod";

export const InvoiceToCreateSchema = z.object({
  customerID: z.number().int().optional(),
  transactionID: z.number().int().optional(),
  invoiceDate: z.string().datetime().optional(),
  dueDate: z.string().datetime().optional(),
  totalAmount: z.number().optional(),
  status: z.string().max(255).optional()
});

export type InvoiceToCreate = z.infer<typeof InvoiceToCreateSchema>;
