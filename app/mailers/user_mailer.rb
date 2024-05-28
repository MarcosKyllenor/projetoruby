require 'csv'

class UserMailer < ApplicationMailer
    default from: "marcos@admin.com"

    def balance_report(user)
        @people = Person.order(:name)
 
        attachments['relatorio.csv'] = { mime_type: 'text/csv', content: csvdata }    

        mail to: user.email, subject: "Relatório de Saldo"
    end

    private

    def csvdata
      CSV.generate do |csv|
        csv << ['Nome', 'Saldo']
        @people.each do |person|
          csv << [person.name, person.balance]
        end
      end
    end

end