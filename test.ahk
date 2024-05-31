x := RegExReplace("[asdf]   # asdf ZYX[qwer]", "\](.*)([^a]*)\[", "][")
MsgBox % x

