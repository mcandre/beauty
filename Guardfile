guard :shell do
  watch('beauty.hs') do |m|
    title = 'Test'
    msg = `./test.sh`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end
end
