using Images

# definindo variáveis
imWidth = 800
imHeight = 600

# definindo matriz
image = RGB.(zeros(imHeight, imWidth))

# criando imagem linear RGB
for j in 1:imHeight
    for i in 1:imWidth
        r = (i - 1) / (imWidth - 1)
        g = 1.0 - (j - 1) / (imHeight - 1)
        b = 0.25

        image[j, i] = RGB(r, g, b)
    end
end

save("rendered/imagem0.png", image)