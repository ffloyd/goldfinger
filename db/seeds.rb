# Про какие еще варианты оформления seeds.rb можешь рассказать?
# В какой ситуации какой лучше подойдет и почему?

# Normal Company
company_one = Company.create!(name: 'Company One')
company_one_loan = Loan.create!(company: company_one,
                              amount_cents: 1_000_000 * 100,
                              months: 6,
                              period: 1)
company_one_loan.months.times do |n|
  company_one_loan.payments.create!(amount_cents: company_one_loan.monthly_debt_total * 100)
end


# Paying Ahead Company
company_two = Company.create!(name: 'Company Two')
company_two_loan = Loan.create!(company: company_two,
                              amount_cents: 1_000_000 * 100,
                              months: 6,
                              period: 1)

payed_normal_months = 3
payed_normal_months.times do |n|
  company_two_loan.payments.create!(amount_cents: company_two_loan.monthly_debt_total * 100)
end

paying_ahead_amount = company_two_loan.amount -
                    (payed_normal_months * company_two_loan.monthly_loan_debt) +
                    company_two_loan.monthly_percents_debt

company_two_loan.payments.create!(amount_cents: paying_ahead_amount * 100)


# Missing Payment Date Company
company_three = Company.create!(name: 'Company Three')
company_three_loan = Loan.create!(company: company_three,
                              amount_cents: 1_000_000 * 100,
                              months: 6,
                              period: 1)
2.times do |n|
  company_three_loan.payments.create!(amount_cents: company_three_loan.monthly_debt_total * 100)
end

4.times do |n|
  company_three_loan.payments.create!(amount_cents: company_three_loan.monthly_extra_total * 100,
                                    extra: true)
end

# New Company
company_four = Company.create!(name: 'Company Four')
company_four_loan = Loan.create!(company: company_four,
                                amount_cents: 1_000_000 * 100,
                                months: 6,
                                period: 1)
4.times do |n|
  company_four_loan.payments.create!(amount_cents: company_four_loan.monthly_debt_total * 100)
end

2.times do |n|
  company_four_loan.payments.create!(amount_cents: company_four_loan.monthly_extra_total * 100,
                                    extra: true)
end
