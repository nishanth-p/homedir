" Highlight Class and Function names
syn match    cConstant       "[A-Z][A-Z0-9_]*" 
syn match    cCustomParen    "(" contains=cParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cConstant Constant
hi def link cCustomFunc  Function
hi def link cCustomClass Function
