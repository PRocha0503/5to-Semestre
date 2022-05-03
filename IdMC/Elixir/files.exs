
# Intro: Pablo Rocha, functions to work with files

defmodule Tfiles do
  def space_to_dash(in_filename,out_file) do
    file = File.stream!(in_filename)
    File.write(out_file,Enum.join(Enum.map(file, fn r -> Enum.join(String.split(r),"-") end),"\n"))
  end
  def space_to_dash_2(in_filename,out_file) do
    file = File.stream!(in_filename)
    File.write(out_file,Enum.join(Enum.map(Enum.map(file, &String.split/1),fn line -> Enum.join(line,"-") end),"\n"))
  end
  def space_to_dash_3(in_filename,out_file) do
    text =
      in_filename
      |> File.stream!()
      |> Enum.map(fn r -> Enum.join(String.split(r),"-")end)
      |> Enum.join("\n")
    File.write(out_file,text)
  end
end

IO.inspect Tfiles.space_to_dash("lloren.txt","primerIntento.txt")
IO.inspect Tfiles.space_to_dash_2("lloren.txt","segIntento.txt")
IO.inspect Tfiles.space_to_dash_3("lloren.txt","terIntento.txt")
