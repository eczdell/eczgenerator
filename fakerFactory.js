import { faker } from "@faker-js/faker";

export const generateChartOfAccountToCreate = () => ({
  accountName: faker.word.noun(),
  accountType: faker.word.noun(),
  accountCode: faker.word.noun(),
  description: faker.word.noun()
});

export const generateChartOfAccountToUpdate = () => ({
  accountName: faker.word.noun(),
  accountType: faker.word.noun(),
  accountCode: faker.word.noun(),
  description: faker.word.noun()
});

export const generateCustomerToCreate = () => ({
  customerName: faker.word.noun(),
  contactEmail: faker.word.noun(),
  phone: faker.word.noun(),
  billingAddress: faker.word.noun()
});

export const generateCustomerToUpdate = () => ({
  customerID: faker.number.int({ min: 1, max: 100 }),
  customerName: faker.word.noun(),
  contactEmail: faker.word.noun(),
  phone: faker.word.noun(),
  billingAddress: faker.word.noun()
});

export const generateInvoiceToCreate = () => ({
  customerID: faker.number.int({ min: 1, max: 100 }),
  transactionID: faker.number.int({ min: 1, max: 100 }),
  invoiceDate: faker.word.noun(),
  dueDate: faker.word.noun(),
  totalAmount: faker.number.float({ min: 10, max: 1000,fractionDigits: 2 }),
  status: faker.word.noun()
});

export const generateInvoiceToUpdate = () => ({
  customerID: faker.number.int({ min: 1, max: 100 }),
  transactionID: faker.number.int({ min: 1, max: 100 }),
  invoiceDate: faker.word.noun(),
  dueDate: faker.word.noun(),
  totalAmount: faker.number.float({ min: 10, max: 1000,fractionDigits: 2 }),
  status: faker.word.noun()
});

export const generateVendorToCreate = () => ({
  vendorName: faker.word.noun(),
  contactEmail: faker.word.noun(),
  phone: faker.word.noun(),
  billingAddress: faker.word.noun()
});

export const generateVendorToUpdate = () => ({
  vendorName: faker.word.noun(),
  contactEmail: faker.word.noun(),
  phone: faker.word.noun(),
  billingAddress: faker.word.noun()
});
