

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
        {0,0,0,0,0,0,0,0,0,31,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    }

    wheel = 0


	self.bg = love.graphics.newImage("inventario/bg.png")
	self.TOPimg = love.graphics.newImage("assets/cards/cardfont/TOP.png")
	self.BOTimg = love.graphics.newImage("assets/cards/cardfont/BOT.png")
	self.MALTOPimg = love.graphics.newImage("assets/cards/cardfont/MALTOP.png")
	self.MALBOTimg = love.graphics.newImage("assets/cards/cardfont/MALBOT.png")

	if self.card == nil then
		self.card = {}
		for w=1,32 do
			self.card[w] = love.graphics.newImage("assets/cards/cardimg/cardimg"..w..".png")
		end

		self.card.width = self.card[1]:getWidth()/2
		self.card.height = self.card[1]:getHeight()/2
		self.card.offset = 10
		self.card.max = 30 --carte nella scelta inventario
	
	--Proprietà carte
		self.card.attributi = {Personaggio,Name,ATK,hp,INFO}
		self.card.attributi.Personaggio = {}
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
		--self.card.bordo = {}
		--self.card.ATK = {}
		for i=1,1 do --Sciagghi
			--Maledizione/Personaggio
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "SCIAGGHI"
			self.card.attributi.ATK[i] = 2800
			self.card.attributi.hp[i] = 28000
			self.card.attributi.INFO.classe[i] = "GOLDEN STAFF SEGRETARIO"
				self.card.attributi.INFO.color.r[i] = 227
				self.card.attributi.INFO.color.g[i] = 215
				self.card.attributi.INFO.color.b[i] = 43
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Canale di Scooby-Doo
+1000 ATK]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[La prima repubblica 
 Una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificare Sciagghi per
 evocare il Pepone]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end
		for i=2,2 do -- Ping
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "PING"
			self.card.attributi.ATK[i] = 2000
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "ADMIN"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Ho programmato io questo gioco!
se ci sono 2 carte uguali sul campo
 si disintegrano entrambe 
              -è una D4C reference]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 4
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=3,3 do -- Cosmi
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "COSMI"
			self.card.attributi.ATK[i] = 1900
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Explosion:
-rotellina del mouse per attivare
-tasto sx per danno ad area]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 3
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=4,4 do -- Hardcore Jack
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "HARDCORE JACK"
			self.card.attributi.ATK[i] = 1500
			self.card.attributi.hp[i] = 40000
			self.card.attributi.INFO.classe[i] = "..."
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Bread:
+5 hp a una carta a scelta]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=5,5 do -- Trill
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "TRILL"
			self.card.attributi.ATK[i] = 1000
			self.card.attributi.hp[i] = 23000
			self.card.attributi.INFO.classe[i] = "..."
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Kill:
uccidi un carta avversaria]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=6,6 do -- Gin Fotonic
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "GIN FOTONIC"
			self.card.attributi.ATK[i] = 1300
			self.card.attributi.hp[i] = 24000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Sing:
danno da ballo]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=7,7 do -- Shadow Grimm
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "SHADOW GRIMM"
			self.card.attributi.ATK[i] = 1500
			self.card.attributi.hp[i] = 24000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Urlo del sium:
stordisce gli avversari]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=8,8 do -- Ceo of Sex inc
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "CEO OF SEX INC"
			self.card.attributi.ATK[i] = 1700
			self.card.attributi.hp[i] = 22000
			self.card.attributi.INFO.classe[i] = "ADMIN"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 155
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Veleno:
avvelena a una carta a scelta]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=9,9 do -- lolfun
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "LOLFUN"
			self.card.attributi.ATK[i] = 1800
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=10,10 do -- Padanian Shitposter
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "PADANIAN SHITPOSTER"
			self.card.attributi.ATK[i] = 2500
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=11,11 do -- Aria
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "ARIA"
			self.card.attributi.ATK[i] = 200
			self.card.attributi.hp[i] = 16000
			self.card.attributi.INFO.classe[i] = "ARTISTA"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[COMMISSIONE_NON_PAGATA:
attacchi infiniti per 5 secondi]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=12,12 do -- Charlie Ebony
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "CHARLIE EBONY"
			self.card.attributi.ATK[i] = 2900
			self.card.attributi.hp[i] = 9000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=13,13 do -- Juj
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "JUJ"
			self.card.attributi.ATK[i] = 1400
			self.card.attributi.hp[i] = 13000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Bello stu' 'rulog
un utente avversario diventa tuo]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=14,14 do -- Sakura
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "SAKURA"
			self.card.attributi.ATK[i] = 1000
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "ARTISTA"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 55
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[polvere di stelle
muovi il mouse e disegna schizzi]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=15,15 do -- Mostro di Firenze
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "MOSTRO DI FIRENZE"
			self.card.attributi.ATK[i] = 6000
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "DisAbilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[si elimina da sola
 dopo 2 turni]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 2
		end
		for i=16,16 do -- La Morte Oscura
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "MORTE OSCURA"
			self.card.attributi.ATK[i] = 1700
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "INGEGNERE DEI MEMES"
				self.card.attributi.INFO.color.r[i] = 150
				self.card.attributi.INFO.color.g[i] = 230
				self.card.attributi.INFO.color.b[i] = 90
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Laser della Morte
tieni premuto tasto sx e rilascalo]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=17,17 do -- Plytlas
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "PLYTLAS"
			self.card.attributi.ATK[i] = 2000
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[quando evocata:
ogni utente avversario di classe 
"CONTENT CREATOR" e "GOLDEN STAFF SEGRETARIO" 
perde 500 ATK]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[...]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 4
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=18,18 do -- Inazuma sensei
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "INAZUMA SENSEI"
			self.card.attributi.ATK[i] = 1700
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Telecinesi
muovi le carte avversarie]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[durante Telecinesi
se muovi le carte in verticale
li stordisci,
in orizzontale gli fai danno]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 4
		end
		for i=19,19 do -- Alex
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "ALEX"
			self.card.attributi.ATK[i] = 1800
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[aculei dal culo]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 1
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=20,20 do -- Doppialex
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "DOPPIALEX"
			self.card.attributi.ATK[i] = 2800
			self.card.attributi.hp[i] = 2800
			self.card.attributi.INFO.classe[i] = "CONTENT CREATOR"
				self.card.attributi.INFO.color.r[i] = 55
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=21,21 do -- Carly
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "CARLY"
			self.card.attributi.ATK[i] = 1200
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "GOLDEN STAFF SEGRETARIO"
				self.card.attributi.INFO.color.r[i] = 227
				self.card.attributi.INFO.color.g[i] = 215
				self.card.attributi.INFO.color.b[i] = 43
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Switch
scambia ATK e HP di una carta]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[La prima repubblica 
 Una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificare Sciagghi per
 evocare il Pepone]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end
		for i=22,22 do -- VOID
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "VOID"
			self.card.attributi.ATK[i] = 2000
			self.card.attributi.hp[i] = 20000
			self.card.attributi.INFO.classe[i] = "GOLDEN STAFF SEGRETARIO"
				self.card.attributi.INFO.color.r[i] = 227
				self.card.attributi.INFO.color.g[i] = 215
				self.card.attributi.INFO.color.b[i] = 43
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[La prima repubblica 
 Una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificare Sciagghi per
 evocare il Pepone]]

 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end
		for i=23,23 do -- Cring3_Crimson
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "CRING3_CRIMSON"
			self.card.attributi.ATK[i] = 1700
			self.card.attributi.hp[i] = 27000
			self.card.attributi.INFO.classe[i] = "INGEGNERE DEI MEMES"
				self.card.attributi.INFO.color.r[i] = 150
				self.card.attributi.INFO.color.g[i] = 230
				self.card.attributi.INFO.color.b[i] = 90
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=24,24 do -- Fat Chad Yoshi
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "FAT CHAD YOSHI"
			self.card.attributi.ATK[i] = 1000
			self.card.attributi.hp[i] = 10000
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Annulla l'effetto di una carta carte]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 1
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=25,25 do -- Disegni e Fan Art
			self.card.attributi.Personaggio[i] = false
			self.card.attributi.Name[i] = "DISEGNI E FAN ART"
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "CANALE"
				self.card.attributi.INFO.color.r[i] = 40
				self.card.attributi.INFO.color.g[i] = 10
				self.card.attributi.INFO.color.b[i] = 150
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[ad ogni ARTISTA:
+300 ATK
+300 HP]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=26,26 do -- menancing
			self.card.attributi.Personaggio[i] = false
			self.card.attributi.Name[i] = "MENANCING"
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=27,27 do -- Demon Core
			self.card.attributi.Personaggio[i] = false
			self.card.attributi.Name[i] = "DEMON CORE"
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "MEME"
				self.card.attributi.INFO.color.r[i] = 155
				self.card.attributi.INFO.color.g[i] = 255
				self.card.attributi.INFO.color.b[i] = 55
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[Cancro:
uccidi tutte le carte sul terreno tra 3 turni]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=28,28 do -- #memes
			self.card.attributi.Personaggio[i] = false
			self.card.attributi.Name[i] = "#MEMES"
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = "CANALE"
				self.card.attributi.INFO.color.r[i] = 40
				self.card.attributi.INFO.color.g[i] = 10
				self.card.attributi.INFO.color.b[i] = 150
				self.card.attributi.INFO.color.a[i] = 255
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[ad ogni INGEGNERE DEI MEMES:
+300 ATK
+300 HP]]
			self.card.attributi.INFO.Tabilita2[i] = ""
			self.card.attributi.INFO.tabilita2[i] = 
[[]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 0
		end
		for i=29,29 do -- Made in Haven
			self.card.attributi.Personaggio[i] = false
			self.card.attributi.Name[i] = "MADE IN HAVEN"
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[... 
 ... 
 ... 
 ...
 ...]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end
		for i=30,30 do -- Moyai
			self.card.attributi.Personaggio[i] = false
			self.card.attributi.Name[i] = "MOYAI"
			self.card.attributi.Mana[i] = 0
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[... 
 ... 
 ... 
 ...
 ...]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
 		end
		for i=31,31 do -- Mortius
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "MORTIUS"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[... 
 ... 
 ... 
 ...
 ...]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end
		for i=32,32 do -- Verel
			self.card.attributi.Personaggio[i] = true
			self.card.attributi.Name[i] = "VEREL"
			self.card.attributi.ATK[i] = 0
			self.card.attributi.hp[i] = 100
			self.card.attributi.INFO.classe[i] = ":::"
				self.card.attributi.INFO.color.r[i] = 255
				self.card.attributi.INFO.color.g[i] = 155
				self.card.attributi.INFO.color.b[i] = 255
				self.card.attributi.INFO.color.a[i] = 200
			self.card.attributi.INFO.Tabilita1[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita1[i] = 
[[...:
...:]]
			self.card.attributi.INFO.Tabilita2[i] = "Abilità speciale"
			self.card.attributi.INFO.tabilita2[i] = 
[[... 
 ... 
 ... 
 ...
 ...]]
 			self.card.attributi.INFOlinee.classe[i] = 1
 			self.card.attributi.INFOlinee.Tabilita1[i] = 1
 			self.card.attributi.INFOlinee.tabilita1[i] = 2
 			self.card.attributi.INFOlinee.Tabilita2[i] = 1
 			self.card.attributi.INFOlinee.tabilita2[i] = 5
		end

	end
	self.card.current = self.card.max

	self.deck = {}
	--self.deck.current = 1
	self.deck.max = 30
	self.deck.total = 0
	--self.copies = {}
	--for i=1,30 do
	--	self.copies[i] = 0
	--end
	self.edit = "card"

	self.selection = {}
	for i=1,8 do
		self.selection[i] = love.graphics.newImage("inventario/select/"..i..".png")
	end
	self.selection.width = self.selection[1]:getWidth()
	self.selection.current = 5

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
				if self.card.attributi.Personaggio[id] then
					--Nome, ATK
					love.graphics.setFont(Font.cardName)
					
					CARDstats.Name.font = love.graphics.getFont()
					CARDstats.Name.Width[id] = CARDstats.Name.font:getWidth(self.card.attributi.Name[id])
					CARDstats.Name.Height[id] = CARDstats.Name.font:getHeight(self.card.attributi.Name[id])/4
					if CARDstats.Name.Width[id] > 266 then
						CARDstats.Name.scale[id] = 1/2
					else
					CARDstats.Name.scale[id] = 1
					end
					--CARts.ATK = {font,Width,Height}
					CARDstats.ATK.font = love.graphics.getFont()
					CARDstats.ATK.Width[id] = CARDstats.ATK.font:getWidth(self.card.attributi.ATK[id])
					CARDstats.ATK.Height[id] = CARDstats.ATK.font:getHeight(self.card.attributi.ATK[id])/4
					if CARDstats.ATK.Width[id] > 90 then
						CARDstats.ATK.Width[id] = 90
					end
				else
					--Nome, Mana
					love.graphics.setFont(Font.cardName)
					--Cìs = {Name,Mana,hp}
					--CAs.Name = {font,Width,Height,scale}
					CARDstats.Name.font = love.graphics.getFont()
					CARDstats.Name.Width[id] = CARDstats.Name.font:getWidth(self.card.attributi.Name[id])
					CARDstats.Name.Height[id] = CARDstats.Name.font:getHeight()/4
					if CARDstats.Name.Width[id] > 266 then
						CARDstats.Name.scale[id] = 1/2
					else
						CARDstats.Name.scale[id] = 1
					end
					
					
					CARDstats.Mana.font = love.graphics.getFont()
					CARDstats.Mana.Width[id] = CARDstats.Mana.font:getWidth(self.card.attributi.Mana[id])
					CARDstats.Mana.Height[id] = CARDstats.Mana.font:getHeight()/4
					if CARDstats.Mana.Width[id] > 90 then
						CARDstats.Mana.Width[id] = 90
					end
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
		wheel = wheel+10
	elseif y < 0 then
		wheel = wheel-10
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
					if general:aabb((j-1)*window.width/64, wheel+(i-1)*window.height/48, self.card.width, self.card.height, mouse.x, mouse.y, 1, 1) then
						if button == 1 then
							table.insert(self.deck, w)
							self.deck.total = self.deck.total+1
						end
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
	--self:INVENTARIO_COLOR_CARDS()
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

				--for c,card in ipairs(inventario.card) do
					if self.card.attributi.Personaggio[id] then
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
					else 	--Mana
						love.graphics.print(self.card.attributi.Mana[id], self.card.x+self.card.width/2, self.card.y+self.card.height, self.card.r, 1/3, 1/3, CARDstats.Mana.Width[id]/3, CARDstats.Mana.Height[id]*1.5)
					end

					--Name
				love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
				love.graphics.print(self.card.attributi.Name[id],self.card.x + self.card.width/2, (self.card.y + ((7.5)*self.card.height/11)), 0, CARDstats.Name.scale[id]* 1/3,1/3, CARDstats.Name.Width[id]/2, self.card.height / 4)
				--end
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
		love.graphics.print("Prendi		altre	carte", screen.width / 2 - 270 + 1, 350 + 1)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255))
		love.graphics.print("Prendi		altre	carte", screen.width / 2 - 270, 350)
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
	if self.card.attributi.Personaggio[id] then --se è un personaggio
		love.graphics.setColor(love.math.colorFromBytes(self.card.attributi.INFO.color.r[id],self.card.attributi.INFO.color.g[id],self.card.attributi.INFO.color.b[id],255))
		love.graphics.draw(self.TOPimg, x, y)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
		love.graphics.draw(self.BOTimg, x, y)
	else
		love.graphics.setColor(love.math.colorFromBytes(self.card.attributi.INFO.color.r[id],self.card.attributi.INFO.color.g[id],self.card.attributi.INFO.color.b[id],255))
		love.graphics.draw(self.MALTOPimg, x, y-10)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
		love.graphics.draw(self.MALBOTimg, x, y-10)
	end
end


function LOAD_inventario()
	inventario:load()
end
function UPDATE_inventario(dt)
	inventario:update(dt)
	--HOVER_inventario_DECK()
end
function DRAW_inventario()
	inventario:draw()
	inventario:drawinfo()
end