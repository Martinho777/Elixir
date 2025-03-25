defmodule Calculadora do

  def iniciar do
    IO.puts("Ingrese un numero entero positivo: ")
    entrada = IO.gets("> ") |> String.trim() |> String.to_integer()
    calcular(entrada)
  end