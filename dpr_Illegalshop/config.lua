Config = {

    Illegalshop = {
        position = { -- Position du shop illegal sur la map
            vector3(2180.7, 3501.4, 45.3)
        }
    },

    Ped = true,

    PedType = 'a_m_m_eastsa_01', -- Voir https://docs.fivem.net/docs/game-references/ped-models/
    PedPosition = vector3(2182.37, 3500.53, 44.41), -- Position du ped
    PedRotation = 72.44, -- Rotation du ped
    
    Item = {
        {Nom = "Weed", Item = "weed", Price = 200, Message = "Achète moi cette ~r~Weed ~s~! C'est d'la bonne !"},
        {Nom = "Coke", Item = "coke", Price = 200, Message = "Prend sa ou j'te ~r~bute ~s~!"},
        {Nom = "Meth", Item = "meth", Price = 200, Message = "T'aime sa ? Ba ~r~paie ~s~wesh !"},
        {Nom = "Opium", Item = "opium", Price = 200, Message = "Elle toute ~r~fraiche ~s~!"},
    },

    Text = "Appuyez sur ~r~[E] ~s~pour accéder au ~r~shop illegal ~s~!", -- Text écris lors de l'approche du blip voir: https://discord.gg/dkHFBkBBPZ Channel couleur pour changer la couleur du texte 

    MarkerType = 20, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 1.0, -- Largeur du marker
    MarkerSizeEpaisseur = 1.0, -- Épaisseur du marker
    MarkerSizeHauteur = 1.0, -- Hauteur du marker
    MarkerDistance = 6.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)
}