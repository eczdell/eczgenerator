// src/app/actions/fetchData.ts
'use server';
const base_url = "https://api.example.com"
import { Chartofaccounts} from "@/types/Chartofaccounts";

export async function fetchChartofaccountsData(): Promise<Chartofaccounts[]> {
  const response = await fetch(`${base_url}/Chartofaccounts`);
  if (!response.ok) {
    throw new Error('Failed to fetch Chartofaccounts');
  }
  return response.json();
}


