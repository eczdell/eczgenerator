import { z } from "zod";

export const ChartOfAccountToUpdateSchema = z.object({
  accountName: z.string().max(100).optional(),
  accountType: z.string().max(50).optional(),
  accountCode: z.string().max(10).optional(),
  description: z.string().max(255).optional()
});

export type ChartOfAccountToUpdate = z.infer<typeof ChartOfAccountToUpdateSchema>;
