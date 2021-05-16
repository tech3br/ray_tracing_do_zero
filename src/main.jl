using Images
include("vector.jl")

# Define Image
acpectRatio = 16 / 9
imWidth = 800
imHeight = trunc(Int64, imWidth / acpectRatio)
image = RGB.(zeros(imHeight, imWidth))

# Define Camera
viewPortHeight = 2.0
viewPortWidth = viewPortHeight * acpectRatio
horizontal = Vec3(viewPortWidth, 0.0, 0.0)  
vertical = Vec3(0.0, viewPortHeight, 0.0)  
focalLenght = 1.0 
origin = Vec3(0.0, 0.0, 0.0)
lowerLeftCorner = origin - horizontal / 2 - vertical / 2 - Vec3(0.0, 0.0, focalLenght)  

println("Image size $imWidth x $imHeight")

function rayColor(ray::Ray)
    t = 0.5 * (ray.direction[2] + 1.0)
    (1-t)RGB(1.0, 1.0, 1.0) + t*RGB(0.5, 0.7, 1.0) 
end

# create image linear RGB
for j in 1:imHeight
    for i in 1:imWidth
        u = (i - 1) / (imWidth - 1)
        v = 1.0 - (j - 1) / (imHeight - 1)
        dir = lowerLeftCorner + u*horizontal + v*vertical - origin
        ray = Ray(origin, dir)
        image[j, i] = rayColor(ray)
    end
end

save("rendered/imagem1.png", image)