import time

def main():
    print("Hello, world!")

    while True:
        print("Hi, I'm still here!")
        time.sleep(1)

        with open("data/data.txt", "w") as file:
            log = f"write file! {time.ctime()}"
            file.write(log)
            print(log)

       

if __name__ == "__main__":
    main()