# svn blame some_file.txt | awk -f svn-blame.awk

function green(s) {
    printf "\033[1;32m" s "\033[0m "
}

BEGIN {
    FS = " ";
}

{ 
    names[$2]++;
}

END {
    print "Lines written";
    n = asorti(names, sortedNames);
    for (i=n; i!=0; i--) {
        name = sortedNames[i];
        if (i == n)
        {
            print green(name "=" names[name]);
        }
        else
        {
            print name "=" names[name];
        }
    }
}
