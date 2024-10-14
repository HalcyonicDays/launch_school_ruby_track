class Loan
  attr_reader :amount, :rate, :term, :term_units

  def initialize(loan_params, term_units='years')
    @amount = loan_params[:amount]
    @rate = loan_params[:rate]
    @term = loan_params[:term]
    @term_units = term_units
  end

  def monthly_payment
    payment = amount *
                (monthly_interest_rate /
                (1 - (1 + monthly_interest_rate)**(-monthly_term)))

    format("%.2f", payment)
  end

  def total_payment
    format("%.2f", monthly_payment.to_f * monthly_term)
  end

  def interest_paid
    format("%.2f", total_payment.to_f - amount)
  end

  def monthly_interest_rate
    rate.to_f / 12 / 100
  end

  def monthly_term
    term_units == 'years' ? term.to_f * 12 : term.to_f
  end
end

auto_loan = {
  amount: 35_000,
  rate: 2.99,
  term: 10
}

home_loan = {
  amount: 350_000,
  rate: 4.15,
  term: 30
}

personal_loan = {
  amount: 5421,
  rate: 1.2,
  term: 36
}

=begin
It's not that I didn't think about data validation, but rather, that I would
expect it to happen elsewhere - specifically, when building the input fields on
a web form, the format and allowable values of the webform, as well as the language
used to explain the data input would be responsible for communicating expectations to
the user, as well as ensuring only acceptable values (i.e. floats) are permitted
=end

auto = Loan.new(auto_loan)
home = Loan.new(home_loan)
personal = Loan.new(personal_loan, 'months')

[auto, home, personal].each do |loan|
  puts "your monthly payment is: $#{loan.monthly_payment}"
  puts "total paid is: $#{loan.total_payment}"
  puts "interest paid is: $#{loan.interest_paid}"
end

=begin
# While this may be the expected approach, I would prefer to focus my practice
# on what I believe is the more realistic real-world application for this
# tool, which is a web brower or desktop app (with gui), rather than CLI

  def validate_input(input, type)
    case type
    when :dollars
    when :percent
    when :month
    end
  end

  puts "enter loan amount ($):"
  loan_amount = validate_input(gets.chomp, :dollars)

  puts "enter interest rate (as %):"
  apr = validate_input(gets.chomp, :percent)

  puts "enter loan term (in months):"
  loan_term = validate_input(gets.chomp, :months)
=end
