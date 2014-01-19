guard :shell do
  watch(/^Makefile|\.(hs|sh|txt)$/) do |m|
    title = 'Test'
    eager './test.sh'
    status = ($?.success? && :success) || :failed
    n '', title, status
    ''
  end
end
