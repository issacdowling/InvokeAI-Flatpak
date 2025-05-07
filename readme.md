# InvokeAI Flatpak

## Preface:
I don't use Stable Diffusion, Flux, or whatever other new image generation models come out often. I don't enjoy generating images wholly much, and I don't find that they provide much practical utility, and that's setting aside the moral issues with these tools.

That said, I'm not immune to a fun tech demo, and inpainting is a compelling image editing feature that I use from time to time, so I'd at least like to be able to do it in a Flatpak. That's why this repo exists.

## How:
This just downloads the latest AppImage from the official site and packages it as a Flatpak. You can see this in the flatpak manifest and the package script, they're both fairly simple. All you need to do is run `package.sh` to get it "built" and installed.
