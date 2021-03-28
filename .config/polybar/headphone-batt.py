import subprocess as sub

result = sub.run(['headsetcontrol', '-b', '-c'], stdout=sub.PIPE, stderr=sub.PIPE)
err = result.stderr.decode('utf-8')
out = result.stdout.decode('utf-8')

if err != '':
    print('Not Connected')
elif out == '-1':
    print('Charging')
else:
    print(out + '%')