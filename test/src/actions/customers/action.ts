// src/app/actions/fetchData.ts
'use server';
const base_url = "https://api.example.com"
import { Customers} from "@/types/Customers";

export async function fetchCustomersData(): Promise<Customers[]> {
  const response = await fetch(`${base_url}/Customers`);
  if (!response.ok) {
    throw new Error('Failed to fetch Customers');
  }
  return response.json();
}


