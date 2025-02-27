import { z } from "zod";

export const CustomerToCreateSchema = z.object({
  customerName: z.string().max(100).optional(),
  contactEmail: z.string().max(100).optional(),
  phone: z.string().max(20).optional(),
  billingAddress: z.string().max(255).optional()
});

export type CustomerToCreate = z.infer<typeof CustomerToCreateSchema>;
