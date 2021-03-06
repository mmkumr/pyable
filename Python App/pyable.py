"""Pyable app"""
import tkinter as tk
from PIL import Image, ImageTk
import login


Root = tk.Tk()
Root.attributes('-fullscreen', True)
Root.title("Pyable")
Root.configure(bg="blue")
image = Image.open('./img.jpg')
# The (450, 350) is (height, width)
image = image.resize((Root.winfo_screenwidth(), Root.winfo_screenheight()),
                     Image.ANTIALIAS)
bg = ImageTk.PhotoImage(image)

canvas = tk.Canvas(Root, width=Root.winfo_screenwidth(),
                   height=Root.winfo_screenheight())
canvas.pack(fill="both", expand=True)
# Display image
canvas_image = canvas.create_image(0, 0, image=bg,
                                   anchor="nw")
loginclass = login.Login()
loginclass.create(canvas).tkraise()
Root.mainloop()
