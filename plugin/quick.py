# -*- coding=utf-8 -*-

import chardet

def quick_2_code( s, src_code, des_code ):
    ret = s
    enc = chardet.detect( s )['encoding']
    if enc != None and enc.lower() == src_code.lower() :
        # print chardet.detect( s )['encoding']
        ret = s.decode(src_code.lower()).encode(des_code)
    return ret

if __name__ == '__main__' :
    f = open( 'F:\\Programming\\MacaqueIM\\trunk\\base\\include\\xxx' )
    a = f.readlines(-1)
    for l in a :
        print quick_2_code(l, 'gb2312', 'utf-8')
    f.close()

