// src/app/actions/fetchData.ts
'use server';
const base_url = "https://api.example.com"
import { Invoices} from "@/types/Invoices";

export async function fetchInvoicesData(): Promise<Invoices[]> {
  const response = await fetch(`${base_url}/Invoices`);
  if (!response.ok) {
    throw new Error('Failed to fetch Invoices');
  }
  return response.json();
}


