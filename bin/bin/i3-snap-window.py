import sys

def backtick(command):
    """
    Equivalent of Bourne shell's backtick
    See http://www.python.org/doc/2.5.1/lib/node534.html
    """
    from subprocess import Popen, PIPE
    print("backtick: command='%s'\n" % command)
    value = Popen(["bash", "-c", command], stdout=PIPE).communicate()[0].rstrip()
    #print "returning '%s'\n" % value
    return(value)

if (int(sys.argv[1]) == 1):
    backtick("i3-msg -- move position %d px %d px" % ( 0, 0))
    backtick("i3-msg -- resize set %d px %d px" % ( 1366 / 2, 768))
elif (int(sys.argv[1]) == 2):
    backtick("i3-msg -- move position %d px %d px" % ( 1366 / 2, 0))
    backtick("i3-msg -- resize set %d px %d px" % ( 1366 / 2, 768))
sys.exit(0)
