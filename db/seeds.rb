company_one = Company.create(name: 'Company One')
company_one_loan = Loan.create(company: company_one,
                              amount_cents: 1_000_000 * 100,
                              months: 6,
                              period: 1)
company_one_loan.months.times do |n|
  Payment.create(loan: company_one_loan,
                amount_cents: company_one_loan.monthly_debt_total * 100)
end