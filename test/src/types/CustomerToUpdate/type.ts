import { z } from "zod";

export const CustomerToUpdateSchema = z.object({
  customerID: z.number().int().optional(),
  customerName: z.string().max(100).optional(),
  contactEmail: z.string().max(100).optional(),
  phone: z.string().max(20).optional(),
  billingAddress: z.string().max(255).optional()
});

export type CustomerToUpdate = z.infer<typeof CustomerToUpdateSchema>;
