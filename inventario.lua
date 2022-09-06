

inventario = {}

function inventario:load()

	imap = {
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,11,0,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,13,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,0,0,0,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,17,0,0,0,0,0,0,0,0,0,18,0,0,0,0,0,0,0,0,0,19,0,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,22,0,0,0,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,27,0,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,31,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,33,0,0,0,0,0,0,0,0,0,34,0,0,0,0,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,36,0,0,0,0,0,0,0,0,0,37,0,0,0,0,0,0,0,0,0,38,0,0,0,0,0,0,0,0,0,39,0,0,0,0,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,41,0,0,0,0,0,0,0,0,0,42,0,0,0,0,0,0,0,0,0,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    }

    wheel = 0

        --background
	self.bg = love.graphics.newImage("assets/inventario/bg.png")
	   --leva
	self.leva_epicentro = {}
	self.leva_epicentro.img = love.graphics.newImage("assets/inventario/leva_epicentro.png")
	self.leva_epicentro.x = window.width*0.941
	self.leva_epicentro.y = window.height*0.5
	self.leva_epicentro.width = self.leva_epicentro.img:getWidth()
	self.leva_epicentro.height = self.leva_epicentro.img:getHeight()

	self.leva = {}
	self.leva.img = love.graphics.newImage("assets/inventario/leva.png")
	self.leva.x = self.leva_epicentro.x+self.leva_epicentro.width*0.1
	self.leva.y = self.leva_epicentro.y-self.leva_epicentro.height*0.275
	self.leva.r = math.pi
	self.leva.scale = .25
	self.leva.width = self.leva.img:getWidth()
	self.leva.height = self.leva.img:getHeight()

	self.TOPimg = love.graphics.newImage("assets/cards/cardfont/TOP.png")
	self.BOTimg = love.graphics.newImage("assets/cards/cardfont/BOT.png")
	self.MALTOPimg = love.graphics.newImage("assets/cards/cardfont/MALTOP.png")
	self.MALBOTimg = love.graphics.newImage("assets/cards/cardfont/MALBOT.png")
	self.Pingimg = love.graphics.newImage("assets/cards/cardfont/Pingimg.png")

	if self.card == nil then
		self.card = {}
		for w=1,43 do
			self.card[w] = love.graphics.newImage("assets/cards/cardimg/cardimg"..w..".png")
		end

		self.card.width = self.card[1]:getWidth()/2
		self.card.height = self.card[1]:getHeight()/2
		self.card.offset = 10
		self.card.max = 30 --carte nel mazzo
	
	--Proprietà carte
		self.card.attributi = {Utente,Name,ATK,hp,INFO}
		self.card.attributi.Utente = {}
		self.card.attributi.Name = {}
		self.card.attributi.ATK = {}
		self.card.attributi.Mana = {}
		self.card.attributi.hp = {}
		self.card.attributi.INFO = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2,color}
		self.card.attributi.INFO.classe = {}
		self.card.attributi.INFO.Tabilita1 = {}
		self.card.attributi.INFO.tabilita1 = {}
		self.card.attributi.INFO.Tabilita2 = {}
		self.card.attributi.INFO.tabilita2 = {}
		self.card.attributi.INFO.color = {}
		self.card.attributi.INFO.color.r = {}
		self.card.attributi.INFO.color.g = {}
		self.card.attributi.INFO.color.b = {}
		self.card.attributi.INFO.color.a = {}
		self.card.attributi.INFOlinee = {}
		self.card.attributi.INFOlinee.classe = {}
		self.card.attributi.INFOlinee.Tabilita1 = {}
		self.card.attributi.INFOlinee.tabilita1 = {}
		self.card.attributi.INFOlinee.Tabilita2 = {}
		self.card.attributi.INFOlinee.tabilita2 = {}

		for i=1,1 do --Sciagghi
			--Reazione/Utente
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "SCIAGGHI"
			self.card.attributi.ATK[i] = 2800
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 14000
			self.card.attributi.INFO.classe[i] = "GOLDEN STAFF SEGRETARIO"
				self.card.attributi.INFO.color.r[i] = 227
				self.card.attributi.INFO.color.g[i] = 215
				self.card.attributi.INFO.color.b[i] = 43
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Canale di Scooby-Doo:
 una carta guadagna ATK pari a
 metà dell'ATK di questa carta
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità passiva"
			self.card.attributi.INFO.tabilita2[i] = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 4
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end
		for i=2,2 do -- Lucy
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "LUCY"
			self.card.attributi.ATK[i] = 1200
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "GOLDEN STAFF SEGRETARIO"
				self.card.attributi.INFO.color.r[i] = 227
				self.card.attributi.INFO.color.g[i] = 215
				self.card.attributi.INFO.color.b[i] = 43
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Switch
scambia ATK e HP di una carta]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità passiva"
			self.card.attributi.INFO.tabilita2[i] = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end
		for i=3,3 do -- VOID
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "VOID"
			self.card.attributi.ATK[i] = 2000
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "GOLDEN STAFF SEGRETARIO"
				self.card.attributi.INFO.color.r[i] = 227
				self.card.attributi.INFO.color.g[i] = 215
				self.card.attributi.INFO.color.b[i] = 43
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità passiva"
			self.card.attributi.INFO.tabilita1[i] = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 5
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=4,4 do -- Hardcore Jack
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "HARDCORE JACK"
			self.card.attributi.ATK[i] = 1500
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Bread:
 cura una carta di un valore
 pari all'ATK di questa carta
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 4
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=5,5 do -- Trill
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "TRILL"
			self.card.attributi.ATK[i] = 1000
			self.card.attributi.Mana[i] = 4
			self.card.attributi.hp[i] = 11500
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Kill:
 uccidi un carta avversaria
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=6,6 do -- Gin Fotonic
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "GIN FOTONIC"
			self.card.attributi.ATK[i] = 1300
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 12000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[OSU:
 fai danno a ritmo
 (tasto dx per colpire i cerchi)]]
			self.card.attributi.INFO.Tabilita2[i] = "Consiglio"
			self.card.attributi.INFO.tabilita2[i] = 
[[si veloce]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 1
		end
		for i=7,7 do -- Shadow Grimm
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "SHADOW GRIMM"
			self.card.attributi.ATK[i] = 1500
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 12000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Urlo del sium:
 stordisce gli avversari
 (tasto dx per selezionare le carte)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=8,8 do -- Nabboleone
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "NABBOLEONE"
			self.card.attributi.ATK[i] = 1700
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 11000
			self.card.attributi.INFO.classe[i] = "ADMIN"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 52
				self.card.attributi.INFO.color.b[i] = 38
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Gangam Style:
 avvelena a una carta a scelta
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=9,9 do -- lolfun
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "LOLFUN"
			self.card.attributi.ATK[i] = 1800
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[una carta guadagna ATK pari
 all'ATK di questa carta
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=10,10 do -- Padanian Shitposter
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "PADANIAN SHITPOSTER"
			self.card.attributi.ATK[i] = 2500
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 5000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[Dimezza gli HP
 di ogni carta aversaria]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=11,11 do -- Aria
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "ARIA"
			self.card.attributi.ATK[i] = 200
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 8000
			self.card.attributi.INFO.classe[i] = "ARTISTA"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[COMMISSIONE NON PAGATA:
 attacchi infiniti per 5 secondi]]
			self.card.attributi.INFO.Tabilita2[i] = "Consiglio"
			self.card.attributi.INFO.tabilita2[i] = 
[[Team Up:
 quando COMMISSIONE NON PAGATA
 è attiva tutte le Aria sul
 campo attaccano insieme]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 4
		end
		for i=12,12 do -- Charlie Ebony
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "CHARLIE EBONY"
			self.card.attributi.ATK[i] = 2900
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 4500
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità passiva"
			self.card.attributi.INFO.tabilita1[i] = 
[[sacrifica questa carta
 per ottenere 4 Mana anzichè 1]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita2[i] = 
[[raddoppia gli HP 
 di ogni carta sul
 tuo terreno]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 3
		end
		for i=13,13 do -- Juj
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "JUJ"
			self.card.attributi.ATK[i] = 1400
			self.card.attributi.Mana[i] = 5
			self.card.attributi.hp[i] = 6500
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Bello stu' 'rulog:
 un utente avversario diventa tuo
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=14,14 do -- Sakura
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "SAKURA"
			self.card.attributi.ATK[i] = 1000
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "ARTISTA"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[polvere di stelle
 (muovi il mouse per disegnare Stelle)]]
			self.card.attributi.INFO.Tabilita2[i] = "Consiglio"
			self.card.attributi.INFO.tabilita2[i] = 
[[La carta obbiettivo è 
 la carta avversaria presente 
 da più tempo]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 3
		end
		for i=15,15 do -- Mostro di Firenze
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "MOSTRO DI FIRENZE"
			self.card.attributi.ATK[i] = 16000
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Disbilità passiva"
			self.card.attributi.INFO.tabilita1[i] = 
[[si elimina da sola
 dopo 2 turni]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=16,16 do -- La Morte Oscura
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "MORTE OSCURA"
			self.card.attributi.ATK[i] = 1700
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "INGEGNERE DEI MEMES"
				self.card.attributi.INFO.color.r[i] = 150
				self.card.attributi.INFO.color.g[i] = 230
				self.card.attributi.INFO.color.b[i] = 90
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Laser della Morte:
tieni premuto tasto dx e rilascalo]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=17,17 do -- Plytlas
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "PLYTLAS"
			self.card.attributi.ATK[i] = 2000
			self.card.attributi.Mana[i] = 1
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[ogni utente avversario di classe 
 "CONTENT CREATOR" o "GOLDEN STAFF SEGRETARIO" 
 avversario perde 500 ATK]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=18,18 do -- Inazuma sensei
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "INAZUMA SENSEI"
			self.card.attributi.ATK[i] = 1700
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Telecinesi:
 muovi le carte avversarie
 (tenere premuto tasto dx per 
 raccogliere le carte)]]
			self.card.attributi.INFO.Tabilita2[i] = "Consiglio"
			self.card.attributi.INFO.tabilita2[i] = 
[[durante Telecinesi
 se muovi le carte in verticale
 le stordisci,
 in orizzontale le fai danno]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 4
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 4
		end
		for i=19,19 do -- Alex
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "ALEX"
			self.card.attributi.ATK[i] = 1200
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Aculei dal culo:
 spara 6 aculei
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=20,20 do -- Doppialex
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "DOPPIALEX"
			self.card.attributi.ATK[i] = 2000
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = ""
			self.card.attributi.INFO.tabilita1[i] = 
[[]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 0
 			self.card.attributi.INFOlinee.tabilita1[i] = 0
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=21,21 do -- Ping
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "PING"
			self.card.attributi.ATK[i] = 200
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "ADMIN"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 52
				self.card.attributi.INFO.color.b[i] = 38
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Ho programmato io questo gioco!
 se ci sono 2 carte uguali sul campo
 si disintegrano entrambe]]
			self.card.attributi.INFO.Tabilita2[i] = "Consiglio"
			self.card.attributi.INFO.tabilita2[i] = 
[[  -è una D4C reference]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end
		for i=22,22 do -- Cosmi
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "COSMI"
			self.card.attributi.ATK[i] = 1900
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Explosion:
 infligge danno ad area
 (tasto dx per selezionare l'area)]]
			self.card.attributi.INFO.Tabilita2[i] = "Consiglio"
			self.card.attributi.INFO.tabilita2[i] = 
[[minore è la distanza dal centra
 maggiore è il danno
 danno massimo: 2500]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 3
		end
		for i=23,23 do -- Cring3_Crimson
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "CRING3_CRIMSON"
			self.card.attributi.ATK[i] = 1700
			self.card.attributi.Mana[i] = 1
			self.card.attributi.hp[i] = 13500
			self.card.attributi.INFO.classe[i] = "INGEGNERE DEI MEMES"
				self.card.attributi.INFO.color.r[i] = 150
				self.card.attributi.INFO.color.g[i] = 230
				self.card.attributi.INFO.color.b[i] = 90
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[passano 2 turni]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 1
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=24,24 do -- Fat Chad Yoshi
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "FAT CHAD YOSHI"
			self.card.attributi.ATK[i] = 2500
			self.card.attributi.Mana[i] = 4
			self.card.attributi.hp[i] = 75000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Annulla l'effetto di una carta
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 1
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=25,25 do -- Mortius
			self.card.attributi.Utente[i] = true
			if ((hoster and (Testo[1] == "Morbius" or Testo[1] == "morbius" or Testo[1] == "MORBIUS"))
			 or (connesso and (Testo[2] == "Morbius" or Testo[2] == "morbius" or Testo[2] == "MORBIUS"))) then
				self.card.attributi.Name[i] = "MORBIUS"
			else
				self.card.attributi.Name[i] = "MORTIUS"
			end
			self.card.attributi.ATK[i] = 2000
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 11000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[evoca un minion
 (tasto dx per selezionare lo spazio)]]
			self.card.attributi.INFO.Tabilita2[i] = "frase ad effetto"
			self.card.attributi.INFO.tabilita2[i] = 
[[FINO ALLA MORTE ED OLTRE]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 1
		end
		for i=26,26 do -- Verel
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "VEREL"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.Mana[i] = 9
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "ARTISTA"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[l'avversario chiude il gioco]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 1
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=27,27 do -- Il sam
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "IL.SAM"
			self.card.attributi.ATK[i] = 1800
			self.card.attributi.Mana[i] = 1
			self.card.attributi.hp[i] = 4000
			self.card.attributi.INFO.classe[i] = "MODERATORE"
				self.card.attributi.INFO.color.r[i] = 184
				self.card.attributi.INFO.color.g[i] = 9
				self.card.attributi.INFO.color.b[i] = 88
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[rendi una carta
 classe "INGEGNERE DEI MEMES"]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=28,28 do -- Esagono
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "ESAGONO"
			self.card.attributi.ATK[i] = 1800
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 6000
			self.card.attributi.INFO.classe[i] = "MODERATORE"
				self.card.attributi.INFO.color.r[i] = 184
				self.card.attributi.INFO.color.g[i] = 9
				self.card.attributi.INFO.color.b[i] = 88
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[tutte le carte sul tuo terreno
 costano 1 Mana in meno]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=29,29 do -- Disegni e Fan Art
			self.card.attributi.Utente[i] = false
			self.card.attributi.Name[i] = "DISEGNI E FAN ART"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.Mana[i] = 1
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "CANALE"
				self.card.attributi.INFO.color.r[i] = 40
				self.card.attributi.INFO.color.g[i] = 10
				self.card.attributi.INFO.color.b[i] = 150
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[ad ogni ARTISTA:
+800 ATK
+800 HP]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=30,30 do -- BAN
			self.card.attributi.Utente[i] = false
			self.card.attributi.Name[i] = "BAN"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "AZIONE"
				self.card.attributi.INFO.color.r[i] = 66
				self.card.attributi.INFO.color.g[i] = 132
				self.card.attributi.INFO.color.b[i] = 245
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[Kill:
 uccidi un carta avversaria
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
 		end
		for i=31,31 do -- Demon Core
			self.card.attributi.Utente[i] = false
			self.card.attributi.Name[i] = "DEMON CORE"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.Mana[i] = 4
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "MEME"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[Cancro:
 uccidi tutte le carte
 sul terreno tra 3 turni]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=32,32 do -- #memes
			self.card.attributi.Utente[i] = false
			self.card.attributi.Name[i] = "#MEMES"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.Mana[i] = 1
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "CANALE"
				self.card.attributi.INFO.color.r[i] = 40
				self.card.attributi.INFO.color.g[i] = 10
				self.card.attributi.INFO.color.b[i] = 150
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[ad ogni INGEGNERE DEI MEMES:
 +800 ATK
 +800 HP]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=33,33 do -- Made in Heaven
			self.card.attributi.Utente[i] = false
			self.card.attributi.Name[i] = "MADE IN HEAVEN"
			self.card.attributi.ATK[i] = 1800
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 4000
			self.card.attributi.INFO.classe[i] = "AZIONE"
				self.card.attributi.INFO.color.r[i] = 66
				self.card.attributi.INFO.color.g[i] = 132
				self.card.attributi.INFO.color.b[i] = 245
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[la partita si
 conclude tra 2 minuti]]
			self.card.attributi.INFO.Tabilita2[i] = "Consiglio"
			self.card.attributi.INFO.tabilita2[i] = 
[[Il timer accellera ma
 si può resettare se
 evochi un altro Made in Heaven]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 3
		end
		for i=34,34 do -- Moyai
			self.card.attributi.Utente[i] = false
			self.card.attributi.Name[i] = "MOYAI"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "MEME"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[una carta avversaria 
 perde 1500 ATK
 (tasto dx per selezionare la carta)]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
 		end
 		for i=35,35 do -- Kronk Drip
			self.card.attributi.Utente[i] = false
			self.card.attributi.Name[i] = "KRONK DRIP"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "MEME"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[+1000 HP a ogni carta sul tuo terreno]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita2[i] = 
[[-100 ATK a ogni carta sul terreno avversario]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 1
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 1
		end
 		for i=36,36 do -- Jenny
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "JENNY"
			self.card.attributi.ATK[i] = 1600
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 8000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = ""
			self.card.attributi.INFO.tabilita1[i] = 
[[]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 0
 			self.card.attributi.INFOlinee.tabilita1[i] = 0
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
 		for i=37,37 do -- Carly
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "CARLY"
			self.card.attributi.ATK[i] = 1600
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 8000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = ""
			self.card.attributi.INFO.tabilita1[i] = 
[[]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 0
 			self.card.attributi.INFOlinee.tabilita1[i] = 0
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
 		for i=38,38 do -- Raiden
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "RAIDEN"
			self.card.attributi.ATK[i] = 1600
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 8000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità passiva"
			self.card.attributi.INFO.tabilita1[i] = 
[[c'è una possibilità su 15
 di parare il colpo]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità passiva"
			self.card.attributi.INFO.tabilita2[i] = 
[[c'è una possibilità su 25
 di danneggiare la carta avversaria
 che sta attaccando questa carta]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 3
		end
 		for i=39,39 do -- Edd
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "EDD"
			self.card.attributi.ATK[i] = 1600
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 8000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = ""
			self.card.attributi.INFO.tabilita1[i] = 
[[]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 0
 			self.card.attributi.INFOlinee.tabilita1[i] = 0
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
 		for i=40,40 do -- Fizz
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "FIZZ"
			self.card.attributi.ATK[i] = 1600
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 8000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Super Cute:
 lancia cuori, curano 100 HP l'uno]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
 		for i=41,41 do -- Uomo Piccione
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "UOMO PICCIONE"
			self.card.attributi.ATK[i] = 1600
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 8000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = ""
			self.card.attributi.INFO.tabilita1[i] = 
[[]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 0
 			self.card.attributi.INFOlinee.tabilita1[i] = 0
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
 		for i=42,42 do -- Schrödinger
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "SCHRöDINGER"
			self.card.attributi.ATK[i] = 1600
			self.card.attributi.Mana[i] = 2
			self.card.attributi.hp[i] = 8000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità a evocazione"
			self.card.attributi.INFO.tabilita1[i] = 
[[Questa carta è immune al primo attacco]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità passiva"
			self.card.attributi.INFO.tabilita2[i] = 
[[se Verel è sul campo questa carta 
 guadagna +500 ATK e + 300 HP]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 1
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 2
		end
		 for i=43,43 do -- Doom Slayer
			self.card.attributi.Utente[i] = true
			self.card.attributi.Name[i] = "DOOM SLAYER"
			self.card.attributi.ATK[i] = 4000
			self.card.attributi.Mana[i] = 3
			self.card.attributi.hp[i] = 9000
			self.card.attributi.INFO.classe[i] = "MEMBRO ONORARIO"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[+500 HP a questa carta]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 1
 			self.card.attributi.INFOlinee.Tabilita2[i] = 0
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
	end

    if not ToolBox and love.filesystem.getInfo("deck.txt") then							--ripristinare per caricare il mazzo
        dataSerializzato = love.filesystem.read("deck.txt")
        data = bitser.loads(dataSerializzato)
		self.deck = data.deck 
        self.copies = data.copies
    else
		self.deck = {}
		self.deck.max = 30 --massimo carte nel mazzo
		self.deck.total = 0
		self.copies = {}
		for i=1,43 do
			self.copies[i] = 0
		end
	end
	--self.edit = "card"
	inventario:loadSTATS()
end

function inventario:loadSTATS()
	CARDstats = {Name,ATK,hp,Mana}
	CARDstats.Name = {font,Width,Height,scale}
	CARDstats.Name.Width = {}
	CARDstats.Name.Height = {}
	CARDstats.Name.scale = {}
	CARDstats.ATK = {font,Width,Height}
	CARDstats.ATK.Width = {}
	CARDstats.ATK.Height = {}
	CARDstats.Mana = {font,Width,Height}
	CARDstats.Mana.Width = {}
	CARDstats.Mana.Height = {}
	CARDstats.hp = {font,Width,Height}
	CARDstats.hp.Width = {}
	CARDstats.hp.Height = {}
	for i,v in ipairs(imap) do
		for j,id in ipairs(v) do
			if id ~= 0 then
				    --Nome, ATK, Mana, hp
				love.graphics.setFont(Font.cardName)
				
				CARDstats.Name.font = love.graphics.getFont()
				CARDstats.Name.Width[id] = CARDstats.Name.font:getWidth(self.card.attributi.Name[id])
				CARDstats.Name.Height[id] = CARDstats.Name.font:getHeight(self.card.attributi.Name[id])/4
				if CARDstats.Name.Width[id] > 266 then
					CARDstats.Name.scale[id] = 1/2
				else
				CARDstats.Name.scale[id] = 1
				end
				CARDstats.ATK.font = love.graphics.getFont()
				CARDstats.ATK.Width[id] = CARDstats.ATK.font:getWidth(self.card.attributi.ATK[id])
				CARDstats.ATK.Height[id] = CARDstats.ATK.font:getHeight(self.card.attributi.ATK[id])/4
				if CARDstats.ATK.Width[id] > 90 then
					CARDstats.ATK.Width[id] = 90
				end
				
				CARDstats.Mana.font = love.graphics.getFont()
				CARDstats.Mana.Width[id] = CARDstats.Mana.font:getWidth(self.card.attributi.Mana[id])
				CARDstats.Mana.Height[id] = CARDstats.Mana.font:getHeight()/4
				if CARDstats.Mana.Width[id] > 90 then
					CARDstats.Mana.Width[id] = 90
				end
				
				CARDstats.hp.font = love.graphics.getFont()
				CARDstats.hp.Width[id] = CARDstats.hp.font:getWidth(self.card.attributi.hp[id])
				CARDstats.hp.Height[id] = CARDstats.hp.font:getHeight()/4
				if CARDstats.hp.Width[id] > 90 then
					CARDstats.hp.Width[id] = 90
				end
			end
		end
	end
end


function inventario:navigate(x, y)
	if y > 0 then
		wheel = wheel+15
	elseif y < 0 then
		wheel = wheel-15
	end
	if wheel >= 0 then
		wheel = 0 
	end
end

function inventario:select(button)
	if self.deck.total ~= self.deck.max then
		for i,v in ipairs(imap) do
			for j,w in ipairs(v) do
				if w ~= 0 then
					if general:aabb((j-1)*window.width/64, wheel+(i-1)*window.height/48, self.card.width, self.card.height, mouse.x, mouse.y, 1, 1)
                     and button == 1
                      and ((self.copies[w] < 2 and not ToolBox) or (ToolBox)) then
						table.insert(self.deck, w)
						self.copies[w] = self.copies[w]+1
						self.deck.total = self.deck.total+1
					end
				end
			end
		end
	end
	for d,id in ipairs(self.deck) do
		if (general:aabb((d*70)-50, 650, self.card.width, self.card.height, mouse.x, mouse.y, 1, 1) and d <= 15) or 
		(general:aabb(((d-15)*70)-50, 780, self.card.width, self.card.height, mouse.x, mouse.y, 1, 1) and d > 15) then
			if button == 2 then
				table.remove(self.deck, d)
				self.deck.total = self.deck.total-1
			end
		end
	end
end

function inventario:update(dt)
end


function inventario:draw()

	   --BackGround
	love.graphics.draw(self.bg,0,0,0,4,4)
	love.graphics.setFont(Font.cardName)
	   --Collezione
	for i,v in ipairs(imap) do
		for j,id in ipairs(v) do
			if id ~= 0 then

				self.card.x = (j-1)*window.width/64
				self.card.y = wheel+(i-1)*window.height/48
				self:DRAW_TOP_AND_BOT(id, self.card.x, self.card.y)

					if self.card.attributi.Utente[id] then 	--Utenti
							--ATK
						love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
						love.graphics.rectangle("fill",self.card.x + 3*self.card.width/(11*7) , self.card.y + 3*self.card.height/4-2.5, CARDstats.ATK.Width[id],CARDstats.ATK.Height[id])
						love.graphics.setColor(love.math.colorFromBytes(200,200,200,255))
						love.graphics.print(self.card.attributi.ATK[id],self.card.x + 3*self.card.width/(11*7) ,self.card.y + 3*self.card.height/4, 0, 1/4, 1/4)
							--hp
						love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
						love.graphics.rectangle("fill", 25+self.card.x + 3*self.card.width/(11*7) , 22.5+self.card.y + 3*self.card.height/4, CARDstats.hp.Width[id],CARDstats.hp.Height[id])
						love.graphics.setColor(love.math.colorFromBytes(200,200,200,255))
						love.graphics.print(self.card.attributi.hp[id], 25+self.card.x + 3*self.card.width/(11*7) , 25+self.card.y + 3*self.card.height/4, 0, 1/4, 1/4)
					 		--Mana
						love.graphics.setColor(love.math.colorFromBytes(250,250,250,255))
						love.graphics.draw(self.Pingimg, self.card.x+30+self.card.width/2, self.card.y-170+self.card.height, self.card.r, 1/40, 1/40)
						love.graphics.print(self.card.attributi.Mana[id], self.card.x+43+self.card.width/2, self.card.y-156+self.card.height, self.card.r, 1/3, 1/3, CARDstats.Mana.Width[id]/3, CARDstats.Mana.Height[id]*1.5)
					else 		--Reazioni
							--Mana
						love.graphics.setColor(love.math.colorFromBytes(250,250,250,255))
						love.graphics.print(self.card.attributi.Mana[id], self.card.x+self.card.width/2, self.card.y+self.card.height, self.card.r, 1/3, 1/3, CARDstats.Mana.Width[id]/3, CARDstats.Mana.Height[id]*1.5)
					end

					--Name
				love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
				love.graphics.print(self.card.attributi.Name[id],self.card.x + self.card.width/2, (self.card.y + ((7.5)*self.card.height/11)), 0, CARDstats.Name.scale[id]* 1/3,1/3, CARDstats.Name.Width[id]/2, self.card.height / 4)
			end
		end
	end
	--Nel deck
	for d,id in ipairs(self.deck) do
		if d > 15 then
			self:DRAW_TOP_AND_BOT(id, ((d-15)*70)-50, 780)
		else
			self:DRAW_TOP_AND_BOT(id, (d*70)-50, 650)
		end
	end

	love.graphics.setColor(love.math.colorFromBytes(255,255,255))


	love.graphics.setFont(Font.menu)
	if self.deck.total ~= self.deck.max then
		love.graphics.setColor(0,0,0)
		love.graphics.print(
[[Tasto  SX
 per aggiungere

Tasto  Dx
 per togliere

Rotellina
 per muovere

Leva 
 per salvare]], 1, 150 + 1, 0, .5, .45)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255))
		love.graphics.print(
[[Tasto  SX
 per aggiungere

Tasto  Dx
 per togliere

Rotellina
 per muovere

Leva 
 per salvare]], 0, 150, 0, .5, .45)
	else
		love.graphics.setColor(love.math.colorFromBytes(255,255,255))
		love.graphics.print("PREMI	ENTER (o spazio) PER	CONFERMARE", screen.width / 2 - 585 + 1, 350 + 1.5)
		love.graphics.setColor(love.math.colorFromBytes(0,0,0))
		love.graphics.print("PREMI	ENTER (o spazio) PER	CONFERMARE", screen.width / 2 - 585 + 1, 350 - 1)
		love.graphics.setColor(love.math.colorFromBytes(200,25,25))
		love.graphics.print("PREMI	ENTER (o spazio) PER	CONFERMARE", screen.width / 2 - 585, 350)
	end
end

function inventario:drawinfo()
	for i,v in ipairs(imap) do
		for j,id in ipairs(v) do
			if id ~= 0 then
				self.card.x = (j-1)*window.width/64
				self.card.y = wheel+(i-1)*window.height/48
					--INFO
				if general:aabb(self.card.x,self.card.y,self.card.width,self.card.height,mouse.x,mouse.y,1,1) then
					love.graphics.setFont(Font.cardInfo)
					INFOstats = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2,MAXWidth}
					INFOstats.classe = {font,Width,Height,color}
					INFOstats.Tabilita1 = {font,Width,Height}
					INFOstats.tabilita1 = {font,Width,Height}
					INFOstats.Tabilita2 = {font,Width,Height}
					INFOstats.tabilita2 = {font,Width,Height}
					INFOstats.classe.font = love.graphics.getFont()
					INFOstats.classe.Width  = INFOstats.classe.font:getWidth(self.card.attributi.INFO.classe[id])
					INFOstats.classe.Height = INFOstats.classe.font:getHeight()
					INFOstats.Tabilita1.font = love.graphics.getFont()
					INFOstats.Tabilita1.Width  = INFOstats.Tabilita1.font:getWidth(self.card.attributi.INFO.Tabilita1[id])
					INFOstats.Tabilita1.Height = INFOstats.Tabilita1.font:getHeight()
					INFOstats.tabilita1.font = love.graphics.getFont()
					INFOstats.tabilita1.Width  = INFOstats.tabilita1.font:getWidth(self.card.attributi.INFO.tabilita1[id])
					INFOstats.tabilita1.Height = INFOstats.tabilita1.font:getHeight()
					INFOstats.Tabilita2.font = love.graphics.getFont()
					INFOstats.Tabilita2.Width  = INFOstats.Tabilita2.font:getWidth(self.card.attributi.INFO.Tabilita2[id])
					INFOstats.Tabilita2.Height = INFOstats.Tabilita2.font:getHeight()
					INFOstats.tabilita2.font = love.graphics.getFont()
					INFOstats.tabilita2.Width  = INFOstats.tabilita2.font:getWidth(self.card.attributi.INFO.tabilita2[id])
					INFOstats.tabilita2.Height = INFOstats.tabilita2.font:getHeight()
						--riga più larga
					INFOstats.MAXWidth = general:greaterNumber5(INFOstats.classe.Width, INFOstats.Tabilita1.Width, INFOstats.tabilita1.Width, INFOstats.Tabilita2.Width, INFOstats.tabilita2.Width)
			
						--scrittura e colori testi --Info
				 
					love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
					love.graphics.rectangle("fill", mouse.x, mouse.y, INFOstats.MAXWidth, 
						-((INFOstats.classe.Height*self.card.attributi.INFOlinee.classe[id])+(INFOstats.Tabilita1.Height*self.card.attributi.INFOlinee.Tabilita1[id])+(INFOstats.tabilita1.Height*self.card.attributi.INFOlinee.tabilita1[id])+(INFOstats.Tabilita2.Height*self.card.attributi.INFOlinee.Tabilita2[id])+(INFOstats.tabilita2.Height*self.card.attributi.INFOlinee.tabilita2[id])))
					love.graphics.setColor(love.math.colorFromBytes(self.card.attributi.INFO.color.r[id],self.card.attributi.INFO.color.g[id],self.card.attributi.INFO.color.b[id],self.card.attributi.INFO.color.a[id]))
					love.graphics.print(self.card.attributi.INFO.classe[id], mouse.x, mouse.y-INFOstats.classe.Height*(self.card.attributi.INFOlinee.tabilita2[id]+self.card.attributi.INFOlinee.Tabilita2[id]+self.card.attributi.INFOlinee.tabilita1[id]+self.card.attributi.INFOlinee.Tabilita1[id]+self.card.attributi.INFOlinee.classe[id]))
					love.graphics.setColor(love.math.colorFromBytes(255,0,0,255))
					love.graphics.print(self.card.attributi.INFO.Tabilita1[id], mouse.x, mouse.y-INFOstats.Tabilita1.Height*(self.card.attributi.INFOlinee.tabilita2[id]+self.card.attributi.INFOlinee.Tabilita2[id]+self.card.attributi.INFOlinee.tabilita1[id]+self.card.attributi.INFOlinee.Tabilita1[id]))
					love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
					love.graphics.print(self.card.attributi.INFO.tabilita1[id], mouse.x, mouse.y-INFOstats.tabilita1.Height*(self.card.attributi.INFOlinee.tabilita2[id]+self.card.attributi.INFOlinee.Tabilita2[id]+self.card.attributi.INFOlinee.tabilita1[id]))
					love.graphics.setColor(love.math.colorFromBytes(255,0,0,255))
					love.graphics.print(self.card.attributi.INFO.Tabilita2[id], mouse.x, mouse.y-INFOstats.Tabilita2.Height*(self.card.attributi.INFOlinee.tabilita2[id]+self.card.attributi.INFOlinee.Tabilita2[id]))
					love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
					love.graphics.print(self.card.attributi.INFO.tabilita2[id], mouse.x, mouse.y-INFOstats.tabilita2.Height*(self.card.attributi.INFOlinee.tabilita2[id]))
				end
			end
		end
	end
end

function inventario:DRAW_TOP_AND_BOT(id,x,y)
	love.graphics.draw(self.card[id], x, y, 0, 1/2, 1/2)
	if self.card.attributi.Utente[id] then --se è un Utente
		love.graphics.setColor(love.math.colorFromBytes(self.card.attributi.INFO.color.r[id],self.card.attributi.INFO.color.g[id],self.card.attributi.INFO.color.b[id],255))
		love.graphics.draw(self.TOPimg, x, y)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
		love.graphics.draw(self.BOTimg, x, y)
	else
		love.graphics.setColor(love.math.colorFromBytes(self.card.attributi.INFO.color.r[id],self.card.attributi.INFO.color.g[id],self.card.attributi.INFO.color.b[id],255))
		love.graphics.draw(self.MALTOPimg, x, y-9)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
		love.graphics.draw(self.MALBOTimg, x, y-10)
	end
end

function inventario:update_leva(dt)
	if self.leva.r > 0 then
		self.leva.r = self.leva.r+1.69*dt
		if self.leva.r >= math.pi then
			self.leva.r = math.pi
			leva_back = false
		end

	elseif self.leva.r < 0 then
		self.leva.r = self.leva.r-1.69*dt
		if self.leva.r <= -math.pi then
			self.leva.r = math.pi
			leva_back = false
		end
	end
end

function inventario:move_leva(x, y, dx, dy)
	if (love.mouse.isDown(1) or love.mouse.isDown(2)) and general:calculateDistance(self.leva.x, self.leva.y, mouse.x, mouse.y) < 125 then
		if (self.leva.r >= math.pi-0.1 and (general:getAngle(self.leva.x, self.leva.y, mouse.x, mouse.y) <= self.leva.r+0.1)) or 
		(self.leva.r <= math.pi+0.1 and (general:getAngle(self.leva.x, self.leva.y, mouse.x, mouse.y) >= self.leva.r-0.1)) then
			self.leva.r = general:getAngle(self.leva.x, self.leva.y, mouse.x, mouse.y)
			if self.leva.r >= -1.5 and self.leva.r < 0 then
				leva_back = true
		    	self.deck = {}
				self.deck.max = 30 --massimo carte nel mazzo
				self.deck.total = 0
				self.copies = {}
				for i=1,35 do
					self.copies[i] = 0
				end
				inventario:saveDeck()
			elseif self.leva.r <= 1.60 and self.leva.r > 0 then
				leva_back = true
				inventario:saveDeck()
			end
		end
	end
end

function inventario:draw_leva()
	love.graphics.setFont(Font.cardName)
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
	love.graphics.draw(self.leva.img, self.leva.x, self.leva.y, self.leva.r, self.leva.scale, self.leva.scale, 0, self.leva.height/2)
	love.graphics.draw(self.leva_epicentro.img, self.leva_epicentro.x, self.leva_epicentro.y, -math.pi/2, .25,.25)
	love.graphics.print([[
SALVA
DECK]], self.leva.x-120, self.leva.y+100, 0,.5,.5)
	love.graphics.print([[
ELIMINA
DECK]], self.leva.x-120, self.leva.y-150, 0,.5,.5)
end


function inventario:saveDeck()
	data = {}
	data.deck = self.deck
	data.copies = self.copies
	dataSerializzato = bitser.dumps(data)
	love.filesystem.write("deck.txt", dataSerializzato)
end


function LOAD_inventario()
	inventario:load()
end
function UPDATE_inventario(dt)
	inventario:update(dt)
end
function DRAW_inventario()
	inventario:draw()
	inventario:drawinfo()
	inventario:draw_leva()
end