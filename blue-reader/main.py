import time

def main():
    print("Hello, world!")

    while True:
        print("Hi, I'm still here!")
        time.sleep(1)

        # Open a file and print its contents
        try:
            with open("data/data.txt", "r") as file:
                print("read", file.read())
        except FileNotFoundError:
            print("Error: The file 'data.txt' does not exist.")

if __name__ == "__main__":
    main()