require 'subprocess'
require 'sinatra'
require 'pry'

set :bind, '0.0.0.0'

# public key: age1704jjr28gsfxrwg43dy45ug79zkyaa9920fdgzxcdzm6kglupykq8njcw0
def decrypt(encrypted_text)
  Subprocess.check_call(['age', '--decrypt', '-i', 'privatekey.txt', '-'], :stdin => Subprocess::PIPE, :stdout => Subprocess::PIPE) do |child|
    stdout, stderr = child.communicate(encrypted_text)
    return stdout
  end
end

post '/secrets' do
  ciphertext = File.read(params[:file][:tempfile].path)
  puts "======== start secret message ============="
  puts decrypt(ciphertext)
  puts "======== end secret message ==============="
end
