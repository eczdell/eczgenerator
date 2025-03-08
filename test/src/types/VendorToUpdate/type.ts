import { z } from "zod";

export const VendorToUpdateSchema = z.object({
  vendorName: z.string().max(100).optional(),
  contactEmail: z.string().max(100).optional(),
  phone: z.string().max(20).optional(),
  billingAddress: z.string().max(255).optional()
});

export type VendorToUpdate = z.infer<typeof VendorToUpdateSchema>;
