company_one = Company.create(name: 'Company One')
company_one_loan = Loan.create(company: company_one,
                              amount_cents: 1_000_000 * 100,
                              months: 6,
                              period: 1)