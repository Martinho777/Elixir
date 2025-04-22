defmodule Agenda do
  def iniciar do
    menu([])
  end

  def menu(contactos) do
    IO.puts("""
    === Agenda de Contactos ===
    1. Agregar contacto
    2. Buscar contacto
    3. Eliminar contacto
    4. Ver todos los contactos
    5. Salir
    """)
    opcion = IO.gets("Opción: ") |> String.trim()

    case opcion do
      "1" -> menu(agregar_contacto(contactos))
      "2" -> buscar_contacto(contactos); menu(contactos)
      "3" -> menu(eliminar_contacto(contactos))
      "4" -> mostrar_contactos(contactos); menu(contactos)
      "5" -> IO.puts("Adiós!")
      _   -> IO.puts("Opción inválida"); menu(contactos)
    end
  end

  def agregar_contacto(contactos) do
    nombre = IO.gets("Nombre: ") |> String.trim()
    tel = IO.gets("Teléfono: ") |> String.trim()
    email = IO.gets("Email: ") |> String.trim()
    nuevo = %{nombre: nombre, telefono: tel, email: email}
    [nuevo | contactos]
  end

  def buscar_contacto(contactos) do
    nombre = IO.gets("Nombre a buscar: ") |> String.trim()
    encontrado = Enum.filter(contactos, fn c -> c.nombre == nombre end)

    if encontrado == [] do
      IO.puts("No se encontró el contacto.")
    else
      IO.inspect(encontrado)
    end
  end

  def eliminar_contacto(contactos) do
    nombre = IO.gets("Nombre a eliminar: ") |> String.trim()
    Enum.reject(contactos, fn c -> c.nombre == nombre end)
  end

  def mostrar_contactos(contactos) do
    IO.puts("=== Lista de Contactos ===")
    Enum.each(contactos, fn c ->
      IO.puts("Nombre: #{c.nombre}, Tel: #{c.telefono}, Email: #{c.email}")
    end)
  end
end

Agenda.iniciar()