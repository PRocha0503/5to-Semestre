
#Intro: Pablo Rocha, codigo de practica para la situación problema

defmodule Practice do
  def space_to_dash(in_filename,out_file) do
    text =
      in_filename
      |> File.stream!()
      |> Enum.map(fn r -> Enum.join(String.split(r),"-")end)
      |> Enum.join("\n")
    File.write(out_file,text)
  end

  def get_emails(in_filename,out_file) do
    text =
      in_filename
      |>File.stream!()
      |>Enum.map(&email_from_line/1)
      |>Enum.filter(fn x -> x !== nil end)
      |>Enum.map(&hd/1)
      |> Enum.join("\n")
    File.write(out_file,text)
  end

  defp email_from_line(line) do
    Regex.run(~r|\w+(?:\.\w+)*@\w+(?:\.\w+)*\.\w{2,4}|,line)
  end
end

IO.inspect Practice.get_emails("lloren_emails.txt","num.txt")
