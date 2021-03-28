import subprocess as sub

result = sub.run(['apt', 'list', '--upgradeable'], stdout=sub.PIPE, stderr=sub.PIPE)
err = result.stderr.decode('utf-8')
out = result.stdout.decode('utf-8')
lines = out.split('\n')

print(len(lines) - 2) # subtract title and blank line at end