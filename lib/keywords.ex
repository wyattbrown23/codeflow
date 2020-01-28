# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Keywords do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
   alias CodeFlow.Schemas.Item #this tells them where to find the struct.  this was commented out and was the cause for my error below

  def rounded(value, opts \\ []) do

    decimals = Keyword.get(opts, :decimals) || 4
    Float.round(value, decimals)

  end

  def unit_price(%Item{} = item, opts \\ []) do #i had a problem with this Item struct undefined

    item_price = item.price / item.quantity
    case Keyword.get(opts, :mode, :float) do
      :float ->
        item_price

      :money ->
        :erlang.float_to_binary(item_price, decimals: 2)


    end
  end
end
