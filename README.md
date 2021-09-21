### The Case of the Failed Decryption

This is the code for a bug called "the case of the failed decryption".

### how to reproduce the bug

I've set it up in Docker so that it's easy to reproduce

In one terminal, start the webserver like this:

```
docker build . --tag failed-decryption
docker run  -p 4567:4567 -v $PWD:/code -it failed-decryption:latest bundle exec ruby server.rb
```

And then in another terminal, make a POST request to upload an encrypted file like this:

```
curl -X POST localhost:4567/secrets -F file=@broken_encrypted_file.txt
```

You should see this error message in the server logs:

```
======== start secret message =============
age: error: failed to decrypt and authenticate payload chunk
age: report unexpected or unhelpful errors at https://filippo.io/age/report

======== end secret message ===============
```
