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