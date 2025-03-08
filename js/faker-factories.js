[
  CustomerToCreate: { customerName: faker.lorem.word(), contactEmail: faker.lorem.word(), phone: faker.lorem.word(), billingAddress: faker.lorem.word() },
  InvoiceToUpdate: { customerID: faker.datatype.number({ min: 1, max: 100 }), transactionID: faker.datatype.number({ min: 1, max: 100 }), invoiceDate: faker.lorem.word(), dueDate: faker.lorem.word(), totalAmount: faker.datatype.number(), status: faker.lorem.word() },
  VendorToUpdate: { vendorName: faker.lorem.word(), contactEmail: faker.lorem.word(), phone: faker.lorem.word(), billingAddress: faker.lorem.word() }
]

