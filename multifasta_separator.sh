cat hg18.fa | awk '{
        if (substr($0, 1, 1)==">") {filename=(substr($0,2) ".fa")}
        print $0 > filename
}'

# https://gist.github.com/astatham/621901