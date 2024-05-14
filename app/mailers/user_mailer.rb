class UserMailer < ApplicationMailer
  def balance_report(current_user)
    @person = current_user

    mail(to: @person.email, subject: 'Relatório de Saldo')
  end
end