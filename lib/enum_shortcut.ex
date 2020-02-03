# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.EnumShortcut do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias CodeFlow.Fake.Customers
  alias CodeFlow.Schemas.Customer
   alias CodeFlow.Schemas.OrderItem

  alias CodeFlow.Fake.Customers
   alias CodeFlow.Schemas.OrderItem

  @doc """
  Create the desired number of customers. Provide the number of customers to
  create. Something like this could be used in a testing setup.
  """
  def create_customers(0), do: :ok

  def create_customers(number) do
    Enum.each(1..number, fn(num) ->
      # for simplicity, not handling a failed create
      {:ok, _customer} = Customers.create(%{name: "Customer #{num}"})
    end)
  end

  @doc """
  Sum a list of OrderItems to compute the order total.
  """
  def order_total(order_items) do
    Enum.reduce(order_items, 0, fn %OrderItem{} = order_item, total ->
      order_item.quantity * order_item.item.price + total
    end)
  end

  @doc """
  Count the number of active customers. Note: Normally this would be done with a
  query to an SQL database. This is just to practice conditionally incrementing
  a counter and looping using recursion.
  """
  # def count_active(customers) do
  #   Enum.reduce(customers, 0, fn
  #     %Customer{active: true}, total -> total + 1
  #     _customer, total -> total
  #   end)
  # end

  def count_active(customers) do
    Enum.reduce(customers, 0, &do_count_active/2)
  end

  defp do_count_active(%Customer{active: true}, total), do: total + 1
  defp do_count_active(_customer, total), do: total

end
