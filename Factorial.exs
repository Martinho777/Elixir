defmodule Calculadora do

  def iniciar do
    IO.puts("Ingrese un numero entero positivo: ")
    entrada = IO.gets("> ") |> String.trim() |> String.to_integer()
    calcular(entrada)
  end

   def calcular(n) when n < 0 do
    IO.puts("El número debe ser positivo.")
  end

  def calcular(n) do
    resultado = factorial(n)
    IO.puts("El factorial de #{n} es #{resultado}")
  end

 def factorial(0), do: 1
  def factorial(n), do: n * factorial(n - 1)
end


Calculadora.iniciar()