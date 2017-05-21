# Normal Company
company_one = Company.create(name: 'Company One')
company_one_loan = Loan.create(company: company_one,
                              amount_cents: 1_000_000 * 100,
                              months: 6,
                              period: 1)
company_one_loan.months.times do |n|
  company_one_loan.payments.create(loan: company_one_loan,
                                  amount_cents: company_one_loan.monthly_debt_total * 100)
end


# Paying Ahead Company
company_two = Company.create(name: 'Company Two')
company_two_loan = Loan.create(company: company_two,
                              amount_cents: 1_000_000 * 100,
                              months: 6,
                              period: 1)

payed_normal_months = 3
payed_normal_months.times do |n|
  company_two_loan.payments.create(loan: company_two_loan,
                                  amount_cents: company_two_loan.monthly_debt_total * 100)
end

paying_ahead_amount = company_two_loan.amount -
                    (payed_normal_months * company_two_loan.monthly_loan_debt) +
                    company_two_loan.monthly_percents_debt

company_two_loan.payments.create(loan: company_two_loan,
                                amount_cents: paying_ahead_amount * 100)