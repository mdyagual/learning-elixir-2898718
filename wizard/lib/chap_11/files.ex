defmodule Wizard.Files do

  def fileModule() do
    IO.inspect(File.cwd())
    #f = File.read("./lib/chap_11/hello.txt")
    f2 = File.read!("./lib/chap_11/hello.txt")

    File.write("./lib/chap_11/hello.txt", "World") #I override in this calling
    File.write("./lib/chap_11/hello.txt", "\nI'm Mishell", [:append])


    IO.inspect(f2)
  end

  def ioModule_read() do
    f = File.open!("./lib/chap_11/hello.txt", [:read, :utf8])

    IO.inspect(IO.read(f, :line))
    IO.inspect(IO.read(f, :line))
    IO.inspect(IO.read(f, :line))
    File.close(f)
  end

  def ioModule_write() do #Override
    f = File.open!("./lib/chap_11/hello.txt", [:write, :utf8])
    IO.write(f, "I'm Mishell")
    IO.write(f, "\n")
    File.close(f)
  end

  def ioModule_append() do
    f = File.open!("./lib/chap_11/hello.txt", [:append, :utf8])
    IO.write(f, "I'm Dhara")
    IO.write(f, "\n")
    File.close(f)
  end

end
