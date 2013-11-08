guard :shell do
  watch('Gemfile') do |m|
    title = 'Bundler output'
    msg = 'Bundler Failure'
    status = :failed

    if `bundle`
      msg = 'Bundled'
      status = :status
    end

    n msg, title, status

    "-> #{msg}"
  end

  watch('beauty.hs') do |m|
    title = 'Test output'
    msg = 'Output does not match test output'
    status = :failed

    if system('./test.sh')
      msg = 'Matches test output'
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
