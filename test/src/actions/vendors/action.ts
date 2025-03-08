// src/app/actions/fetchData.ts
'use server';
const base_url = "https://api.example.com"
import { Vendors} from "@/types/Vendors";

export async function fetchVendorsData(): Promise<Vendors[]> {
  const response = await fetch(`${base_url}/Vendors`);
  if (!response.ok) {
    throw new Error('Failed to fetch Vendors');
  }
  return response.json();
}


