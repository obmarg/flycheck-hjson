import sys

if __name__ == "__main__":
    try:
        import hjson
        try:
            hjson.load(sys.stdin)
        except hjson.HjsonDecodeError as e:
            print("stdin:{}:{}:{}\n".format(e.lineno, e.colno, e.msg))
            sys.exit(1)
    except ImportError:
        pass
