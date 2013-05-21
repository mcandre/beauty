guard :shell do
  out = open("out.txt").read

  watch("beauty.hs") do |m|
    title = "Test output"
    msg = "Output does not match test output"
    status = :failed

    if system("./test.sh")
      msg = "Matches test output"
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
