from PIL import Image

def encrypt_image(input_path, output_path, key):
    try:
        # Open the image and convert it to RGB mode
        img = Image.open(input_path).convert('RGB')
        pixels = img.load()  # Load pixel data

        # Iterate over each pixel
        for i in range(img.width):
            for j in range(img.height):
                r, g, b = pixels[i, j]

                # Encrypt pixel by adding the key value
                r = (r + key) % 256
                g = (g + key) % 256
                b = (b + key) % 256

                pixels[i, j] = (r, g, b)

        # Save the encrypted image
        img.save(output_path)
        print(f"Image encrypted and saved to {output_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

def decrypt_image(input_path, output_path, key):
    try:
        # Open the image and convert it to RGB mode
        img = Image.open(input_path).convert('RGB')
        pixels = img.load()  # Load pixel data

        # Iterate over each pixel
        for i in range(img.width):
            for j in range(img.height):
                r, g, b = pixels[i, j]

                # Decrypt pixel by subtracting the key value
                r = (r - key) % 256
                g = (g - key) % 256
                b = (b - key) % 256

                pixels[i, j] = (r, g, b)

        # Save the decrypted image
        img.save(output_path)
        print(f"Image decrypted and saved to {output_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

def main():
    while True:
        choice = input("Do you want to (e)ncrypt or (d)ecrypt an image? (q to quit): ").lower()
        if choice == 'q':
            print("Exiting the program.")
            break

        if choice not in ('e', 'd'):
            print("Invalid choice. Please enter 'e' to encrypt, 'd' to decrypt, or 'q' to quit.")
            continue

        input_path = input("Enter the input image path: ")
        output_path = input("Enter the output image path: ")
        try:
            key = int(input("Enter the encryption/decryption key (integer): "))
        except ValueError:
            print("The key must be an integer. Please try again.")
            continue

        if choice == 'e':
            encrypt_image(input_path, output_path, key)
        elif choice == 'd':
            decrypt_image(input_path, output_path, key)

if __name__ == "__main__":
    main()

