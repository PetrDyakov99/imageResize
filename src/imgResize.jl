module ImagesResize
using Images

function main()
    inPath = ARGS[1]
    outPath = ARGS[2]
    newSize = parse(Int,ARGS[3])

    files = readdir(inPath)
    for file in files
        if endswith(file,".jpg") || endswith(file,".png")
            im = load(string(inPath,"/",file))
            height_,weight_ = size(im)
            dif = abs(height_ - weight_)
            if height_ > weight_
                im = im[div(dif,2) + 1 : end - (div(dif,2) + mod(dif,2)), :]
            else
                im = im[:,div(dif,2) + 1 : end - (div(dif,2) + mod(dif,2))]
            end
            im = imresize(im,(newSize,newSize))
            save(string(outPath, "/",file),im)
        end
    end

end
main()
end # module
