# Deval (De-eval)
A simple shell script for decrypt eval encrypted shell script

> [!IMPORTANT]
> If you're using Android (with Termux), We recommend you to run it via shell instead of treating it as an executable because of system hiearchy problem.

```bash
Usage: ./deval.sh <encrypted script>
```

Example: `./deval.sh ./encrypted`

Output: `./encrypted.dec.sh`

Multiple files are supported

## How this script working?
Fetch the encrypted shell script and replace any `eval` command to `echo`, then execute it as shell script. the output still unreadable at this point, execute the output as shell script and you get the readable script.

## Something about `eval` command
You should **NEVER** use any obfuscator tools that using eval for your project and if you do that, **you basically open source'ing your project NOW.**
