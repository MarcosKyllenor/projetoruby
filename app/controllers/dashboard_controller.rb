# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @active_people_pie_chart = Rails.cache.fetch("active_people_pie_chart", expires_in: 1.hour) do
      {
        active: Person.active_people_count,
        inactive: Person.active.count - Person.active_people_count
      }
    end

    @total_debts = Rails.cache.fetch("total_debts", expires_in: 1.hour) do
      Person.total_debts
    end

    @total_payments = Rails.cache.fetch("total_payments", expires_in: 1.hour) do
      Person.total_payments
    end

    @balance = @total_payments - @total_debts

    @last_debts = Rails.cache.fetch("last_debts", expires_in: 1.hour) do
      Person.last_debts
    end

    @last_payments = Rails.cache.fetch("last_payments", expires_in: 1.hour) do
      Person.last_payments
    end

    @my_people = Rails.cache.fetch("my_people_#{current_user.id}", expires_in: 1.hour) do
      Person.my_people(current_user)
    end

    @top_person = Rails.cache.fetch("top_person", expires_in: 1.hour) do
      Person.top_person
    end

    @bottom_person = Rails.cache.fetch("bottom_person", expires_in: 1.hour) do
      Person.bottom_person
    end

    @expensive_debts = Rails.cache.fetch("expensive_debts", expires_in: 1.hour) do
      Debt.expensive_debts
    end
  end
end