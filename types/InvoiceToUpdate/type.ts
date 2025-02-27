import { z } from "zod";

export const InvoiceToUpdateSchema = z.object({
  customerID: z.string().max(null).optional(),
  transactionID: z.string().max(null).optional(),
  invoiceDate: z.string().max(null).optional(),
  dueDate: z.string().max(null).optional(),
  totalAmount: z.string().max(null).optional(),
  status: z.string().max(null).optional()
});

export type InvoiceToUpdate = z.infer<typeof InvoiceToUpdateSchema>;
