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