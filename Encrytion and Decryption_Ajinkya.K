#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:ajinkya kutarmare
#
# Created:     13-07-2024
# Copyright:   (c) ajinkya 2024
# Licence:     <your licence>
#-------------------------------------------------------------------------------
diction= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
def userInterface():
    fin = open('C:/Users/ajinkya/OneDrive/Documents/caear/message.txt', 'r')
    fout = open('C:/Users/ajinkya/OneDrive/Documents/caear/cipher.txt', 'w')
    container = fin.readlines()
    message = ''.join(container)
    message = message.replace(" ", "")
    message = message.upper()

    userInput = input("Welcome \n (type 'e' for encryption)\n (type 'd' for decryption)\n")

    if userInput == "e":
        print("Enter the key value")
        key = int(input())
        fout.write(Encrypt(message, key) + '\n')
    elif userInput == "d":
        print("Enter the key value")
        key = int(input())
        fout.write(Decrypt(message, key) + '\n')
    else:
        print("Entered choice is wrong")
        userInterface()

    fin.close()
    fout.close()

def Encrypt(message, key):
    diction = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    encrypted_message = ""
    for i in message:
        if i in diction:
            location = key + diction.index(i)
            location %= 26
            encrypted_message += diction[location]
        else:
            encrypted_message += i
    print("Encryption is complete\n please check the cipher.txt")
    return encrypted_message

def Decrypt(message, key):
    diction = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    decrypted_message = ""
    for i in message:
        if i in diction:
            location = diction.index(i) - key
            location %= 26
            decrypted_message += diction[location]
        else:
            decrypted_message += i
    print("Decryption is complete\n please check the cipher.txt")
    return decrypted_message

userInterface()

#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:Ajinkya Kutarmare
#
# Created:     16-07-2024
# Copyright:   (c) ajinkya 2024
# Licence:     <your licence>
#-------------------------------------------------------------------------------

from PIL import Image

def encrypt_image(input_path, output_path, key):
    img = Image.open(input_path)
    pixels = img.load()

    width, height = img.size

    for i in range(width):
        for j in range(height):
            r, g, b = pixels[i, j]

            # swapping red and blue channels
            encrypted_pixel = (b, g, r)

            pixels[i, j] = encrypted_pixel

    img.save(output_path)
    print("Image encrypted successfully!")

def decrypt_image(input_path, output_path, key):
    img = Image.open(input_path)
    pixels = img.load()

    width, height = img.size

    for i in range(width):
        for j in range(height):
            r, g, b = pixels[i, j]

            # swapping red and blue channels back
            decrypted_pixel = (b, g, r)

            pixels[i, j] = decrypted_pixel

    img.save(output_path)
    print("Image decrypted successfully!")

 # image path
input_image = r"C:/Users/anshi/OneDrive/Documents/Task02/input_image.jpg"
encrypted_image = r"C:/Users/anshi/OneDrive/Documents/Task02/encryption_image.jpg"
decrypted_image = r"C:/Users/anshi/OneDrive/Documents/Task02/decryption_image.jpg"


# Encrypt the image
encrypt_image(input_image, encrypted_image, key=None)

# Decrypt the image
decrypt_image(encrypted_image, decrypted_image, key=None)
